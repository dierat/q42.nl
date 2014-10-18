Meteor.publish "chat", -> ChatMessages.find({}, {sort: {date: 1}, limit: 20})

Meteor.methods
	setupChatConfig: (token) ->
		ChatConfig.insert token: token

ChatMessages.allow
	insert: (userId, doc) ->
		return false unless userId

		token = ChatConfig.findOne()?.token
		return unless token

		path = doc.path
		url = "https://q42.slack.com/services/hooks/incoming-webhook?token=#{token}"
		pathWithoutHttp = path.replace("http://", "")
		user = Meteor.users.findOne(userId)

		try
			res = HTTP.post url, {
				params:
					payload: JSON.stringify(
						text: ["#{user.profile.name} (<#{path}|#{pathWithoutHttp}>) zegt:", doc.msg].join("\n")
						icon_emoji: ":earth_africa:"
					)
			}
		catch e
			return no

		if res?.content isnt 'ok' then no else yes

Router.map ->
	@route "chat",
		where: "server"
		path: "/api/chat"
		action: ->
			return unless @request.body.token
			msg = @request.body.text.replace("@qsitebot ", "")
			user = @request.body.user_name
			ChatMessages.insert userId: null, username: user, msg: msg, date: new Date(), path: "/api/chat"