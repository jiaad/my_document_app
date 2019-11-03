heroku:
	git push heroku master
migrate:
	rails db:migrate
reset:
	rails db:migrate:reset


