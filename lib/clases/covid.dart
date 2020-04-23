
class Covid{

  String country;
  int cases;
  int todayCases;
  int deaths;
  int todayDeaths;
  int recovered;
  int active;
  int critical;
  int casesPerOneMillion;


  Covid({
    this.country,
  this.cases,
  this.todayCases,
  this.deaths,
  this.todayDeaths,
  this.recovered,
  this.active,
  this.critical,
  this.casesPerOneMillion
  });




	 String getCountry() {
		return this.country;
	}

	 void setCountry(String country) {
		this.country = country;
	}

	 int getCases() {
		return this.cases;
	}

	 void setCases(int cases) {
		this.cases = cases;
	}

	 int getTodayCases() {
		return this.todayCases;
	}

	 void setTodayCases(int todayCases) {
		this.todayCases = todayCases;
	}

	 int getDeaths() {
		return this.deaths;
	}

	 void setDeaths(int deaths) {
		this.deaths = deaths;
	}

	 int getTodayDeaths() {
		return this.todayDeaths;
	}

	 void setTodayDeaths(int todayDeaths) {
		this.todayDeaths = todayDeaths;
	}

	 int getRecovered() {
		return this.recovered;
	}

	 void setRecovered(int recovered) {
		this.recovered = recovered;
	}

	 int getActive() {
		return this.active;
	}

	 void setActive(int active) {
		this.active = active;
	}

	 int getCritical() {
		return this.critical;
	}

	 void setCritical(int critical) {
		this.critical = critical;
	}

	 int getCasesPerOneMillion() {
		return this.casesPerOneMillion;
	}

	 void setCasesPerOneMillion(int casesPerOneMillion) {
		this.casesPerOneMillion = casesPerOneMillion;
	}



}