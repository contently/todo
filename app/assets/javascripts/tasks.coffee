# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


# HW2: hijackToggleLinks allows us to filter rows by completion status
# called from tasks/index.html.haml

window.hijackToggleLinks = () ->
  $('a.tasks_toggle_link').each((i,el) ->
    $el = $(el)
    togtemplate = $el.text()
    toggleval = $el.data('showByDefault')
    relevantRows = $($el.data('needle'))

    $el.click((e) ->
      e.preventDefault()

      # rewrite nav links
      label = if toggleval then 'Showing' else 'Hiding'
      $el.text(togtemplate.replace('%%TOGGLE%%', label))

      # show/ hide rows
      if toggleval
        relevantRows.show()
      else
        relevantRows.hide()

      toggleval = !toggleval
    )

    # activate the method to rewrite the link labels
    $el.click()
  )


