
@UnitTypes = new Mongo.Collection 'unitTypes'

UnitTypes.attachSchema new SimpleSchema(
  name:
    type: String
  assetType:
    type: String
    label: 'Asset Type'
    allowedValues: [
      'Lab Equipment'
      'Fab Asset'
    ]
    autoform:
      type: "select"
      options: -> ({label:x, value:x} for x in [
        'Lab Equipment'
        'Fab Asset'
      ])
  cost:
    type: Number

)