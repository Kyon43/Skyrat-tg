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
	vend_reply = "Time to play!;We are friends now!"

	//STUFF SOLD HERE//
	products = list(


					/obj/item/toy/plush/carpplushie = 30,
                    /obj/item/toy/plush/slimeplushie = 30,
                    /obj/item/toy/plush/moth = 30,
                    /obj/item/toy/plush/snakeplushie = 30,
                    /obj/item/toy/plush/beeplushie = 30,
                    /obj/item/toy/plush/rouny = 30,
                    /obj/item/toy/plush/ratplush = 30
                    )

	premium = list(
		             /obj/item/toy/plush/abductor/agent = 40,
                     /obj/item/toy/plush/bubbleplush = 40,
                     /obj/item/toy/plush/goatplushie = 40,
                     /obj/item/toy/plush/nukeplushie = 40
                     )
	contraband = list(
					/obj/item/toy/plush/skyrat/akira = 50,
					/obj/item/toy/plush/skyrat/fox_maid = 50
					)

	payment_department = ACCOUNT_SRV
	default_price = 30
	extra_price = 250
