
Meteor.publish 'unitTypes', -> UnitTypes.find()
Meteor.publish 'unitType', (id) -> UnitTypes.find({_id:id})