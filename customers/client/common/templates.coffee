Template.unitTable.onCreated ->
  Session.set 'selectedUnitId', null


Template.unitTable.helpers
  unselected: -> not Session.get 'selectedUnitId'
  rowClass: (id) ->
    if id == Session.get 'selectedUnitId' then 'info' else null


Template.unitTable.events
  'click #selUnit': ->
    id = Session.get 'selectedUnitId'
    if @_id == id
      Session.set 'selectedUnitId', null
    else
      Session.set 'selectedUnitId', @_id

  'dblclick #selUnit': (event) ->
    event.preventDefault()
    parent = Template.parentData(1).item
    Session.set 'selectedUnitId', @_id
    Modal.show('unitModal', {root:parent, unit:parent.units[Session.get('selectedUnitId')-1]})

  'click #newBtn': (event) ->
    event.preventDefault()
    Session.set 'selectedUnitId', null
    Modal.show('unitModal', {root:@root})

  'click #editBtn': (event) ->
    event.preventDefault()
    Modal.show('unitModal', {root:@root, unit:@units[Session.get('selectedUnitId')-1]})

  'click #delBtn': (event) ->
    event.preventDefault()
    @units.splice(Session.get('selectedUnitId')-1,1)
    Customers.update({_id:@root._id}, {$set: @root})
    Session.set 'selectedUnitId', null




Template.unitModal.helpers
  selectedId: -> Session.get 'selectedUnitId'

Template.unitModal.events
  'click #unitModalUpdate': (event) ->
    event.preventDefault()
    inDoc = AutoForm.getFormValues('updateUnitModal').insertDoc
    id = Session.get('selectedUnitId')
    if id
      _.extend @root.units[id-1], inDoc
    else
      @root.units.push inDoc
    Customers.update({_id:@root._id}, {$set: @root})
    Session.set 'selectedUnitId', null
    $('#unitModal').modal('hide')


  'click #unitModalCancel': ->
    Session.set 'selectedUnitId', null
    $('#unitModal').modal('hide')