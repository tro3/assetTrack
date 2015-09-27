
@Customers = new Mongo.Collection 'customers',
  transform: (doc) ->
    if doc
      doc.units = _.sortBy doc.units, 'serialNumber'
      doc.units.forEach (unit, ind) ->
        unit._id = ind+1
        unit.type = UnitTypes.findOne(unit.typeID)
    doc


@Unit = new SimpleSchema
  serialNumber:
    type: String
  typeID:
    type: String
    autoform:
      options: ->
        ({label: x.name, value:x._id} for x in UnitTypes.find().fetch())


Customers.attachSchema new SimpleSchema(
  name:
    type: String
  location:
    type: String
  units:
    type: [Unit]
)

