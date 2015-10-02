currentModal = null

# The public API.
@Modal =
  allowMultiple: false,

  show: (templateName, data) ->          
    if currentModal == null
      parentNode = document.body
      view = Blaze.renderWithData(Template[templateName], data, parentNode)
      domRange = view._domrange
      currentModal = domRange.$('.modal')
      currentModal.on('shown.bs.modal', (event) ->
              currentModal.find('[autofocus]').focus()
      )
      currentModal.on('hidden.bs.modal', (event) ->
              Blaze.remove(view)
              currentModal = null
      )      
      currentModal.modal()

  hide: ->
    currentModal.modal('hide')
