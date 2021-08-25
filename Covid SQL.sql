
select *
from CovidDeath
order by 3,4

select *
from CovidVaccinations
order by 3,4

--Select data that we are going to be using
select location,date,total_cases,new_cases,total_deaths,population
from CovidDeath
order by 1,2

-- looking at Total cases vs Total Deaths. Also percentage of dying in countries
select location,date,total_cases,total_deaths, (cast(total_deaths as float)/cast(total_cases as float))*100 as DeathPCT
from CovidDeath
where location like '%states%'
order by 1,2

--Looking at total cases vs population
select location,date,population,total_cases, (cast(total_cases as float))/cast(population as float)*100 as DeathPCTPOP
from CovidDeath
where location like '%united states%'

-- Countries with highest infection rates
select location,population,max(total_cases) as HighestInfectionCount, max((cast( total_cases as float))/cast(population as float))*100 as PctPopInfected
from CovidDeath
--where location like '%united states%'
group by location, population
order by PctPopInfected desc

--- Breaking down by continent
select continent,max(cast(total_deaths as int)) as TotalDeathCount
from CovidDeath
--where location like '%united states%'
where continent is not null
group by continent
order by TotalDeathCount desc

--Show Countries with Highest Death Count Per Population
select location,max(cast(total_deaths as int)) as TotalDeathCount
from CovidDeath
--where location like '%united states%'
where continent is null
group by location
order by TotalDeathCount desc

--Global numbers
select date, sum(new_cases) as total_cases,sum(new_deaths) as total_death, sum(cast(new_deaths as float))/sum(cast(total_deaths as float))*100 as DeathPCT
from CovidDeath
where continent is not null
-- group by date
order by 1,2



-- Looking at total population vs vaccinations

select dea.continent,dea.location,dea.date,dea.population, cast(vac.new_vaccinations as integer)
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated

from CovidDeath dea
join CovidVaccinations vac
    on dea.location=vac.location
    and dea.date=vac.date
where dea.continent is not null
order by 2,3




