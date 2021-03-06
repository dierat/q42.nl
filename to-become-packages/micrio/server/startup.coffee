Meteor.startup ->
  Meteor.publish "micrio", -> Micrios.find()

  if Micrios.find().count() is 0
    _.each [
      { name: "qlego", id: 'a7ba548d-f581-4850-9138-e866a4402bc6',
      width: 4288, height: 2848 }
      { name: "happyplace-mat", id: '9678448d-c698-4a50-8941-40c9bf47ad4f',
      width: 2048, height: 1365 }
      { name: "girl-code", id: '57b761a3-8b2c-4307-a2d5-9a8b10c36a42',
      width: 2048, height: 1365 }

      # { name: "qers-canal", id: '8a872653-53de-489e-8592-2fd3a26828b4',
      # width: 4822, height: 3194 }
      # { name: "qers-beach", id: 'f3d62c26-d934-48ca-9c24-a7f28e544e96',
      # width: 3224, height: 2327 }

      # { name: "q070", id: 'df41b47e-4857-445c-8bde-055b19fe886f',
      # width: 4168, height: 2761 }
      # { name: "electronics", id: '43c17e4b-be7c-4edd-b224-e4cfc33e1a6d',
      # width: 2000, height: 1325 }
      # { name: "sketch", id: '1c9a85c2-6cab-4a30-ac35-f75ab03d4b5f',
      # width: 4288, height: 2848 }
      # { name: "android", id: '1b94ecd4-ed96-4aa1-a975-ac3d60d538fc',
      # width: 4288, height: 2848 }
      # { name: "qers-quitje", id: '55afb507-036d-415e-8398-526969bfb5f4',
      # width: 4825, height: 3196 }
      # { name: "quitje-beach", id: 'e5e368af-cc33-46b5-9f2c-719317b426bd',
      # width: 4928, height: 3264 }
      # { name: "herp", id: 'f456df7e-a206-463a-a637-e3eec6d68467',
      # width: 3264, height: 4928 }
    ], (item) -> Micrios.insert item
