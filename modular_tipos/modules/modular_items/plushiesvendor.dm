/obj/machinery/vending/plushies
	name = "Plu- Plu- PLUSHIES"
	desc = "Soft and cutes."
	icon_state = "plushiesvendor"
	base_icon_state = "plushiesvendor"
	icon = 'modular_tipos/modules/modular_items/plushiesvendor.dmi'
	light_mask = "plushiesvendor-light-mask"
	age_restrictions = TRUE
	///Has the discount card been used on the vending machine?
	var/card_used = FALSE
	product_ads = "Free Hugs!;Soft time!;Play and fun!;Hey you, need a hug?;Come on hug me!;Don't forget to use protection!"
	vend_reply = "Time to play!;We are friends now!;Hermoso como el culo del oso!"

	//STUFF SOLD HERE//
	products = list(
					/obj/item/toy/plush/carpplushie = 5,
                    /obj/item/toy/plush/slimeplushie = 5,
                    /obj/item/toy/plush/moth = 5,
                    /obj/item/toy/plush/snakeplushie = 5,
                    /obj/item/toy/plush/beeplushie = 5,
                    /obj/item/toy/plush/rouny = 5,
                    /obj/item/toy/plush/ratplush = 5
                    )

	premium = list(
		             /obj/item/toy/plush/abductor/agent = 5,
                     /obj/item/toy/plush/bubbleplush = 5,
                     /obj/item/toy/plush/goatplushie = 5,
                     /obj/item/toy/plush/nukeplushie = 5
                     )
	contraband = list(
					/obj/item/toy/plush/tipos/foxte_maid = 1,
					/obj/item/toy/plush/tipos/akira = 1
					)

	payment_department = ACCOUNT_SRV
	default_price = 30
	extra_price = 250


/obj/machinery/vending/plushies/update_icon_state()
	..()
	if(machine_stat & BROKEN)
		icon_state = "[base_icon_state]-broken"
		return

	icon_state = "[base_icon_state][powered() ? null : "-off"]"

/obj/machinery/vending/plushies/attackby(obj/item/O, mob/living/user, params)
	if(default_deconstruction_screwdriver(user, icon_state, icon_state, O))
		if(panel_open)
			add_overlay("[initial(icon_state)]-panel")
		else
			cut_overlay("[initial(icon_state)]-panel")
		SStgui.update_uis(src)
		return
