define [
  'jquery'
  'underscore'
  'backbone'
  'templates'
  'bootstraptabs'
], ($, _, Backbone, JST) ->
  class HackView extends Backbone.View
    template: JST['app/scripts/templates/hack.ejs']
    renderedOnce: false
    rickToggled: false

    tagName: 'div'

    id: ''

    className: ''

    events:
      'click #rick-button': 'toggleRick'

    initialize: () ->


    render: () ->
      $('#hack-button').addClass 'active'
      @$el.html @template toggled: @rickToggled
      unless @renderedOnce
        $ ->
          $('#hack-tab a').click (e) ->
            e.preventDefault()
            $(@).tab('show')
        @renderedOnce = true
      $('#picture-tab').addClass 'active'

    toggleRick: =>
      $('#rick-button').attr 'disabled', true
      $('#great-stuff').addClass 'hidden'
      $.post '/rick',
        {toggle: not @rickToggled},
        (data) =>
          console.debug 'all is well'
          $('#rick-button').removeAttr 'disabled'
          $('#great-stuff').removeClass 'hidden'
          @rickToggled = not @rickToggled
          @render()
