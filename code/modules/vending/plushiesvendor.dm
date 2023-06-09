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

//Changes the settings on the vendor, if the user uses the discount card.
/obj/machinery/vending/dorms/attackby(obj/item/used_item, mob/living/user, params)
	if(!istype(used_item, /obj/item/lustwish_discount))
		return ..()

	user.visible_message(span_boldnotice("Something changes in [src] with a loud clunk."))
	card_used = !card_used

	if(card_used)
		default_price = 0
		extra_price = 0

		return

	default_price = initial(default_price)
	extra_price = initial(extra_price)

///Performs checks to see if the user can change the color on the vending machine.
/obj/machinery/vending/dorms/proc/check_menu(mob/living/user, obj/item/multitool)
	if(!istype(user))
		return FALSE
	if(user.incapacitated())
		return FALSE
	if(!multitool || !user.is_holding(multitool))
		return FALSE

	return TRUE

/obj/machinery/vending/dorms/Initialize(mapload)
	. = ..()
	update_icon_state()
	update_icon()

/obj/machinery/vending/dorms/update_icon_state()
	..()
	if(machine_stat & BROKEN)
		icon_state = "[base_icon_state]-broken"
		return

	icon_state = "[base_icon_state][powered() ? null : "-off"]"
