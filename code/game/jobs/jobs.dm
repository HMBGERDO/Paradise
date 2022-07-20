
GLOBAL_LIST_INIT(command_positions, list(
	"Капитан",
	"Глава Персонала",
	"Глава Службы Безопасности",
	"Главный Инженер",
	"Директор Исследований",
	"Главный Врач",
	"Представитель " + TR_NANOTRASEN
))

GLOBAL_LIST_INIT(captain_positions, list(
	"Капитан"
))


GLOBAL_LIST_INIT(engineering_positions, list(
	"Главный Инженер",
	"Станционный Инженер",
	"Специалист Жизнеобеспечения",
))


GLOBAL_LIST_INIT(medical_positions, list(
	"Главный Врач",
	"Доктор",
	"Генетик",
	"Психиатр",
	"Химик",
	"Вирусолог",
	"Парамедик",
	"Патологоанатом"
))


GLOBAL_LIST_INIT(science_positions, list(
	"Директор Исследований",
	"Научный Сотрудник",
	"Генетик",	//Part of both medical and science
	"Робототехник",
))

//BS12 EDIT
GLOBAL_LIST_INIT(support_positions, list(
	"Глава Персонала",
	"Бармен",
	"Ботаник",
	"Шеф-Повар",
	"Уборщик",
	"Библиотекарь",
	"Квартирмейстер",
	"Грузовой Техник",
	"Шахтёр",
	"Агент Внутренних Дел",
	"Священник",
	"Клоун",
	"Мим",
	"Парикмахер",
	"Магистрат",
	"Представитель " + TR_NANOTRASEN,
	"Синий Щит",
	"Исследователь"
))

GLOBAL_LIST_INIT(supply_positions, list(
	"Глава Персонала",
	"Квартирмейстер",
	"Грузовой Техник",
	"Шахтёр"
))

GLOBAL_LIST_INIT(service_positions, (list("Глава Персонала") + (support_positions - supply_positions)))


GLOBAL_LIST_INIT(security_positions, list(
	"Глава Службы Безопасности",
	"Надзиратель",
	"Детектив",
	"Офицер Службы Безопасности",
	"Магистрат"
))


GLOBAL_LIST_INIT(assistant_positions, list(
	"Ассистент"
))

GLOBAL_LIST_INIT(nonhuman_positions, list(
	"ИИ",
	"Киборг",
	"Drone",
	"pAI"
))

/proc/get_job_datums()
	var/list/occupations = list()
	var/list/all_jobs = typesof(/datum/job)

	for(var/A in all_jobs)
		var/datum/job/job = new A()
		if(!job)	continue
		occupations += job

	return occupations

/proc/get_alternate_titles(job)
	var/list/jobs = get_job_datums()
	var/list/titles = list()

	for(var/datum/job/J in jobs)
		if(!J)	continue
		if(J.title == job)
			titles = J.alt_titles

	return titles

GLOBAL_LIST_INIT(exp_jobsmap, list(
	EXP_TYPE_LIVING = list(), // all living mobs
	EXP_TYPE_CREW = list(titles = command_positions | engineering_positions | medical_positions | science_positions | support_positions | supply_positions | security_positions | assistant_positions | list("AI","Cyborg")), // crew positions
	EXP_TYPE_SPECIAL = list(), // antags, ERT, etc
	EXP_TYPE_GHOST = list(), // dead people, observers
	EXP_TYPE_COMMAND = list(titles = command_positions),
	EXP_TYPE_ENGINEERING = list(titles = engineering_positions),
	EXP_TYPE_MEDICAL = list(titles = medical_positions),
	EXP_TYPE_SCIENCE = list(titles = science_positions),
	EXP_TYPE_SUPPLY = list(titles = supply_positions),
	EXP_TYPE_SECURITY = list(titles = security_positions),
	EXP_TYPE_SILICON = list(titles = list("AI","Cyborg")),
	EXP_TYPE_SERVICE = list(titles = service_positions),
))
