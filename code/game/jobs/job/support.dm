//Cargo
/datum/job/qm
	title = "Квартирмейстер"
	title_old = "Quartermaster"
	flag = JOB_QUARTERMASTER
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_supply = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#e2c59d"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINT, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_CARGO_BOT, ACCESS_QM, ACCESS_MINT, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	outfit = /datum/outfit/job/qm

/datum/outfit/job/qm
	name = "Квартирмейстер"
	jobtype = /datum/job/qm

	uniform = /obj/item/clothing/under/rank/cargo
	shoes = /obj/item/clothing/shoes/brown
	l_ear = /obj/item/radio/headset/headset_cargo
	glasses = /obj/item/clothing/glasses/sunglasses
	id = /obj/item/card/id/supply
	l_hand = /obj/item/clipboard
	pda = /obj/item/pda/quartermaster



/datum/job/cargo_tech
	title = "Грузовой Техник"
	title_old = "Cargo Technician"
	flag = JOB_CARGOTECH
	department_flag = JOBCAT_SUPPORT
	total_positions = 2
	spawn_positions = 2
	is_supply = 1
	supervisors = "евартирмейстер"
	department_head = list("Head of Personnel")
	selection_color = "#eeddbe"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINT, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_CARGO, ACCESS_MAILSORTING, ACCESS_MINERAL_STOREROOM)
	outfit = /datum/outfit/job/cargo_tech

/datum/outfit/job/cargo_tech
	name = "Грузовой Техник"
	jobtype = /datum/job/cargo_tech

	uniform = /obj/item/clothing/under/rank/cargotech
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_cargo
	id = /obj/item/card/id/supply
	pda = /obj/item/pda/cargo



/datum/job/mining
	title = "Шахтёр"
	title_old = "Shaft Miner"
	flag = JOB_MINER
	department_flag = JOBCAT_SUPPORT
	total_positions = 6
	spawn_positions = 8
	is_supply = 1
	supervisors = "квартирмейстер"
	department_head = list("Head of Personnel")
	selection_color = "#eeddbe"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_MAILSORTING, ACCESS_CARGO, ACCESS_QM, ACCESS_MINT, ACCESS_MINING, ACCESS_MINING_STATION, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_MINING, ACCESS_MINT, ACCESS_MINING_STATION, ACCESS_MAILSORTING, ACCESS_MAINT_TUNNELS, ACCESS_MINERAL_STOREROOM)
	alt_titles = list("Spelunker")
	outfit = /datum/outfit/job/mining

/datum/outfit/job/mining
	name = "Шахтёр"
	jobtype = /datum/job/mining

	l_ear = /obj/item/radio/headset/headset_cargo/mining
	shoes = /obj/item/clothing/shoes/workboots/mining
	gloves = /obj/item/clothing/gloves/color/black
	uniform = /obj/item/clothing/under/rank/miner/lavaland
	l_pocket = /obj/item/reagent_containers/hypospray/autoinjector/survival
	r_pocket = /obj/item/storage/bag/ore
	id = /obj/item/card/id/supply
	pda = /obj/item/pda/shaftminer
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/kitchen/knife/combat/survival=1,\
		/obj/item/mining_voucher=1,\
		/obj/item/stack/marker_beacon/ten=1
	)

	backpack = /obj/item/storage/backpack/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	box = /obj/item/storage/box/survival_mining

/datum/outfit/job/mining/equipped
	name = "Шахтёр"

	suit = /obj/item/clothing/suit/hooded/explorer
	mask = /obj/item/clothing/mask/gas/explorer
	glasses = /obj/item/clothing/glasses/meson
	suit_store = /obj/item/tank/internals/emergency_oxygen
	internals_slot = slot_s_store
	backpack_contents = list(
		/obj/item/flashlight/seclite=1,\
		/obj/item/kitchen/knife/combat/survival=1,
		/obj/item/mining_voucher=1,
		/obj/item/t_scanner/adv_mining_scanner/lesser=1,
		/obj/item/gun/energy/kinetic_accelerator=1,\
		/obj/item/stack/marker_beacon/ten=1
	)

/datum/outfit/job/miner/equipped/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	if(istype(H.wear_suit, /obj/item/clothing/suit/hooded))
		var/obj/item/clothing/suit/hooded/S = H.wear_suit
		S.ToggleHood()

/datum/outfit/job/miner/equipped/hardsuit
	name = "Шахтёр (Снаряжение + Костюм)"
	suit = /obj/item/clothing/suit/space/hardsuit/mining
	mask = /obj/item/clothing/mask/breath



//Food
/datum/job/bartender
	title = "Бармен"
	title_old = "Bartender"
	flag = JOB_BARTENDER
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_HYDROPONICS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_BAR, ACCESS_MAINT_TUNNELS, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM)
	outfit = /datum/outfit/job/bartender

/datum/outfit/job/bartender
	name = "Бармен"
	jobtype = /datum/job/bartender

	uniform = /obj/item/clothing/under/rank/bartender
	suit = /obj/item/clothing/suit/armor/vest
	belt = /obj/item/storage/belt/bandolier/full
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	glasses = /obj/item/clothing/glasses/sunglasses/reagent
	pda = /obj/item/pda/bar
	backpack_contents = list(
		/obj/item/toy/russian_revolver = 1
	)

/datum/outfit/job/bartender/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	H.dna.SetSEState(GLOB.soberblock,1)
	singlemutcheck(H, GLOB.soberblock, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.soberblock)
	H.check_mutations = 1



/datum/job/chef
	title = "Шеф-Повар"
	title_old = "Chef"
	flag = JOB_CHEF
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_HYDROPONICS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE)
	minimal_access = list(ACCESS_KITCHEN, ACCESS_MAINT_TUNNELS)
	alt_titles = list("Повар","Кулинарный Художник","Мясник")
	outfit = /datum/outfit/job/chef

/datum/outfit/job/chef
	name = "Шеф-Повар"
	jobtype = /datum/job/chef

	uniform = /obj/item/clothing/under/rank/chef
	suit = /obj/item/clothing/suit/chef
	belt = /obj/item/storage/belt/chef
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/chefhat
	l_ear = /obj/item/radio/headset/headset_service
	pda = /obj/item/pda/chef
	backpack_contents = list(
		/obj/item/eftpos=1,\
		/obj/item/paper/chef=1,\
		/obj/item/book/manual/wiki/chef_recipes=1)

/datum/outfit/job/chef/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	var/datum/martial_art/cqc/under_siege/justacook = new
	justacook.teach(H)


/datum/job/hydro
	title = "Ботаник"
	title_old = "Botanist"
	flag = JOB_BOTANIST
	department_flag = JOBCAT_SUPPORT
	total_positions = 3
	spawn_positions = 2
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_HYDROPONICS, ACCESS_MAINT_TUNNELS, ACCESS_BAR, ACCESS_KITCHEN, ACCESS_MORGUE)
	minimal_access = list(ACCESS_HYDROPONICS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS)
	alt_titles = list("Гидропоник", "Ботанический Исследователь")
	outfit = /datum/outfit/job/hydro

/datum/outfit/job/hydro
	name = "Ботаник"
	jobtype = /datum/job/hydro

	uniform = /obj/item/clothing/under/rank/hydroponics
	suit = /obj/item/clothing/suit/apron
	gloves = /obj/item/clothing/gloves/botanic_leather
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	suit_store = /obj/item/plant_analyzer
	pda = /obj/item/pda/botanist

	backpack = /obj/item/storage/backpack/botany
	satchel = /obj/item/storage/backpack/satchel_hyd
	dufflebag = /obj/item/storage/backpack/duffel/hydro



//Griff //BS12 EDIT

/datum/job/clown
	title = "Клоун"
	title_old = "Clown"
	flag = JOB_CLOWN
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_CLOWN, ACCESS_THEATRE, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_CLOWN, ACCESS_THEATRE, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/clown

/datum/outfit/job/clown
	name = "Клоун"
	jobtype = /datum/job/clown

	uniform = /obj/item/clothing/under/rank/clown
	shoes = /obj/item/clothing/shoes/clown_shoes
	mask = /obj/item/clothing/mask/gas/clown_hat
	l_pocket = /obj/item/bikehorn
	l_ear = /obj/item/radio/headset/headset_service
	id = /obj/item/card/id/clown
	pda = /obj/item/pda/clown
	backpack_contents = list(
		/obj/item/reagent_containers/food/snacks/grown/banana = 1,
		/obj/item/stamp/clown = 1,
		/obj/item/toy/crayon/rainbow = 1,
		/obj/item/storage/fancy/crayons = 1,
		/obj/item/reagent_containers/spray/waterflower = 1,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofbanana = 1,
		/obj/item/instrument/bikehorn = 1
	)

	implants = list(/obj/item/implant/sad_trombone)

	backpack = /obj/item/storage/backpack/clown
	satchel = /obj/item/storage/backpack/clown
	dufflebag = /obj/item/storage/backpack/duffel/clown

/datum/outfit/job/clown/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.gender == FEMALE)
		mask = /obj/item/clothing/mask/gas/clown_hat/sexy
		uniform = /obj/item/clothing/under/rank/clown/sexy

/datum/outfit/job/clown/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	if(ismachineperson(H))
		var/obj/item/organ/internal/cyberimp/brain/clown_voice/implant = new
		implant.insert(H)

	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	singlemutcheck(H, GLOB.clumsyblock, MUTCHK_FORCED)
	H.dna.default_blocks.Add(GLOB.clumsyblock)
	if(!ismachineperson(H))
		H.dna.SetSEState(GLOB.comicblock, TRUE)
		singlemutcheck(H, GLOB.comicblock, MUTCHK_FORCED)
		H.dna.default_blocks.Add(GLOB.comicblock)
	H.check_mutations = TRUE
	H.add_language("Clownish")

//action given to antag clowns
/datum/action/innate/toggle_clumsy
	name = "Toggle Clown Clumsy"
	button_icon_state = "clown"

/datum/action/innate/toggle_clumsy/Activate()
	var/mob/living/carbon/human/H = owner
	H.dna.SetSEState(GLOB.clumsyblock, TRUE)
	singlemutcheck(H, GLOB.clumsyblock, MUTCHK_FORCED)
	active = TRUE
	background_icon_state = "bg_spell"
	UpdateButtonIcon()
	to_chat(H, "<span class='notice'>You start acting clumsy to throw suspicions off. Focus again before using weapons.</span>")

/datum/action/innate/toggle_clumsy/Deactivate()
	var/mob/living/carbon/human/H = owner
	H.dna.SetSEState(GLOB.clumsyblock, FALSE)
	singlemutcheck(H, GLOB.clumsyblock, MUTCHK_FORCED)
	active = FALSE
	background_icon_state = "bg_default"
	UpdateButtonIcon()
	to_chat(H, "<span class='notice'>You focus and can now use weapons regularly.</span>")

/datum/job/mime
	title = "Мим"
	title_old = "Mime"
	flag = JOB_MIME
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_MIME, ACCESS_THEATRE, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_MIME, ACCESS_THEATRE, ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/mime

/datum/outfit/job/mime
	name = "Мим"
	jobtype = /datum/job/mime

	uniform = /obj/item/clothing/under/mime
	suit = /obj/item/clothing/suit/suspenders
	back = /obj/item/storage/backpack/mime
	gloves = /obj/item/clothing/gloves/color/white
	shoes = /obj/item/clothing/shoes/black
	head = /obj/item/clothing/head/beret
	mask = /obj/item/clothing/mask/gas/mime
	l_ear = /obj/item/radio/headset/headset_service
	id = /obj/item/card/id/mime
	pda = /obj/item/pda/mime
	backpack_contents = list(
		/obj/item/toy/crayon/mime = 1,
		/obj/item/reagent_containers/food/drinks/bottle/bottleofnothing = 1,
		/obj/item/cane = 1
	)

/datum/outfit/job/mime/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(H.gender == FEMALE)
		uniform = /obj/item/clothing/under/sexymime
		suit = /obj/item/clothing/mask/gas/sexymime

/datum/outfit/job/mime/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(visualsOnly)
		return

	if(H.mind)
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/aoe_turf/conjure/build/mime_wall(null))
		H.mind.AddSpell(new /obj/effect/proc_holder/spell/mime/speak(null))
		H.mind.miming = 1



/datum/job/janitor
	title = "Уборщик"
	title_old = "Janitor"
	flag = JOB_JANITOR
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_JANITOR, ACCESS_MAINT_TUNNELS)
	alt_titles = list("Специалист по Уборке")
	outfit = /datum/outfit/job/janitor

/datum/outfit/job/janitor
	name = "Уборщик"
	jobtype = /datum/job/janitor

	uniform = /obj/item/clothing/under/rank/janitor
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	pda = /obj/item/pda/janitor


//More or less assistants
/datum/job/librarian
	title = "Библиотекарь"
	title_old = "Librarian"
	flag = JOB_LIBRARIAN
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = 1
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_LIBRARY, ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_LIBRARY, ACCESS_MAINT_TUNNELS)
	alt_titles = list("Журналист")
	outfit = /datum/outfit/job/librarian

/datum/outfit/job/librarian
	name = "Библиотекарь"
	jobtype = /datum/job/librarian

	uniform = /obj/item/clothing/under/suit_jacket/red
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	l_pocket = /obj/item/laser_pointer
	r_pocket = /obj/item/barcodescanner
	l_hand = /obj/item/storage/bag/books
	pda = /obj/item/pda/librarian
	backpack_contents = list(
		/obj/item/videocam = 1)

/datum/job/barber
	title = "Парикмахер"
	title_old = "Barber"
	flag = JOB_BARBER
	department_flag = JOBCAT_SUPPORT
	total_positions = 1
	spawn_positions = 1
	is_service = TRUE
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	alt_titles = list("Стилист","Косметолог")
	access = list(ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_MAINT_TUNNELS)
	outfit = /datum/outfit/job/barber

/datum/outfit/job/barber
	name = "Парикмахер"
	jobtype = /datum/job/barber

	uniform = /obj/item/clothing/under/barber
	shoes = /obj/item/clothing/shoes/black
	l_ear = /obj/item/radio/headset/headset_service
	backpack_contents = list(
		/obj/item/storage/box/lip_stick = 1,
		/obj/item/storage/box/barber = 1
	)

/datum/job/explorer
	title = "Исследователь"
	title_old = "Explorer"
	flag = JOB_EXPLORER
	department_flag = JOBCAT_SUPPORT
	total_positions = 0
	spawn_positions = 0
	supervisors = "глава персонала"
	department_head = list("Head of Personnel")
	selection_color = "#dddddd"
	access = list(ACCESS_MAINT_TUNNELS, ACCESS_GATEWAY, ACCESS_EVA, ACCESS_EXTERNAL_AIRLOCKS)
	minimal_access = list(ACCESS_MAINT_TUNNELS, ACCESS_GATEWAY, ACCESS_EVA, ACCESS_EXTERNAL_AIRLOCKS)
	outfit = /datum/outfit/job/explorer
	hidden_from_job_prefs = TRUE

/datum/outfit/job/explorer
	// This outfit is never used, because there are no slots for this job.
	// To get it, you have to go to the HOP and ask for a transfer to it.
	name = "Исследователь"
	jobtype = /datum/job/explorer
	uniform = /obj/item/clothing/under/color/random
	shoes = /obj/item/clothing/shoes/black
