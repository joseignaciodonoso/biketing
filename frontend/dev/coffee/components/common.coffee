
app.common =
	init: ->

		$("[data-open-login]").click (e) ->
			$(".login").addClass("login--show")
			$(".login__front--login").addClass("login__front--show")
			$(".login").addClass("login--show--in")
			$("#sections").addClass("sections--left")
			$("header").addClass("header--left")

		$(".login .login__back").click ->
			$(".login").addClass("login--show--out")
			$(".login").removeClass("login--show--in")
			$("#sections").removeClass("sections--left")
			$("header").removeClass("header--left")
			setTimeout ->
				$(".login").removeClass("login--show")
				$(".login__front").removeClass("login__front--show")
			,500

		$("[data-open-register]").click (e) ->
			$(".login").addClass("login--show")
			$(".login__front--register").addClass("login__front--show")
			$(".login").addClass("login--show--in")
			$("#sections").addClass("sections--left")
			$("header").addClass("header--left")

		$(".login .login__back").click ->
			$(".login").addClass("login--show--out")
			$(".login").removeClass("login--show--in")
			$("#sections").removeClass("sections--left")
			$("header").removeClass("header--left")
			setTimeout ->
				$(".login").removeClass("login--show")
				$(".login__front").removeClass("login__front--show")
			,500

		$(".section__search__input input").focus ->
			$(".section__search__back").addClass("section__search__back--show")


		$(".section__search__back").click ->
			$(".section__search__back").addClass("section__search__back--out")
			$(".section__search__results").removeClass("section__search__results--show")
			$(".section__search").removeClass("section__search--openinfo")
			setTimeout ->
				$(".section__search__back").removeClass("section__search__back--out section__search__back--show")
			,500

		$(".clear-info-box").click ->
			$(".section__search").removeClass("section__search--openinfo")
			$(".modal--docs .modal__front").removeClass("modal__front--openinfo")
		


		$("[data-modal-login]").click (e) ->
			e.preventDefault()
			app.common.open(".modal--login")

		$(".modal__close").click ->
			app.common.close $(this).closest(".modal")
			$(".modal--docs .modal__front").removeClass("modal__front--openinfo")



		app.common.autoplay()
		$(".section--testimonies").find(".section__avatar").click ->
			console.log "pikachu"
			index     = $(this).index()
			container = $(this).closest(".section--testimonies")
			app.common.goto(container,index)
			app.common.autoplay()
		autoplayInterval: undefined

	autoplay: ->
		clearTimeout(app.common.autoplayInterval)
		app.common.autoplayInterval = setInterval ->
			$(".section--testimonies").each ->
				container = $(this)
				app.common.next(container)
		,10000

	next: (container) ->
		current = container.find(".section__avatar.current").index()
		next    = current + 1
		next    = 0 if next >= container.find(".section__avatar").length
		app.common.goto(container,next)

	goto: (container,index) ->
		container.find(".section__avatar")
			.removeClass("current")
			.eq(index)
			.addClass("current")
		container.find(".section__testimony")
			.removeClass("in")
			.addClass("out")
			.eq(index)
			.removeClass("out")
			.addClass("in")



	open: (elementclass) ->
		$(elementclass).addClass("modal--in")
			

	close: (modal=false) ->

		modal = $(".modal") if !modal

		modal
			.removeClass("modal--in")
			.addClass("modal--out")

		setTimeout ->
			modal.removeClass("modal--out")
		,200
		
