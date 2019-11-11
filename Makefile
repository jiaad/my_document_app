hr:
	heroku run	
her_push:
	git push heroku master
migrate:
	rails db:migrate
reset:
	rails db:migrate:reset
hr_mig: 
	heroku run rails db:migrate
