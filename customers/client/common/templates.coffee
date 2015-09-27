Template.unitTable.onCreated ->
  Session.set 'selectedUnitId', null


Template.unitTable.helpers
  rowClass: (id) ->
    if id == Session.get 'selectedUnitId' then 'info' else null


Template.unitTable.events
  'click #selUnit': ->
    id = Session.get 'selectedUnitId'
    if @_id == id
      Session.set 'selectedUnitId', null
    else
      Session.set 'selectedUnitId', @_id
    