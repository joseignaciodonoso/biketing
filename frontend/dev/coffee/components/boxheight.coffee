app.boxheight = 

    init: ->
      tallestBox = 0
      $('.same-height').each ->
        if $(this).height() > tallestBox
          tallestBox = $(this).height()
      $('.same-height').height(tallestBox)
      