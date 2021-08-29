


## Welcome to GitHub Pages

Below you can find links to my portfolio: 

1. SQL [editor on GitHub](https://github.com/begen/Ben_Portfolio/blob/06fab362b0591c8a03d930930625855ad3d4d2dd/Covid%20SQL.sql) to see SQL queries
2. Tableau [Dashboard](https://github.com/begen/Ben_Portfolio/blob/83d38b89f0bbfaebcee882a3248697060750fa70/Tableau%20Covid%20Dashboard.png)
3. Python
4. Power Bi
6. Data Science



You can use the [editor on GitHub](https://github.com/begen/Ben_Portfolio/edit/gh-pages/index.md) to maintain and preview the content for your website in Markdown files.

Whenever you commit to this repository, GitHub Pages will run [Jekyll](https://jekyllrb.com/) to rebuild the pages in your site, from the content in your Markdown files.





## SQL Statements
``` javascript
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

Global numbers

--1

--Global numbers
select  sum(new_cases) as total_cases, sum(cast(new_deaths as int)) as total_death, sum(cast(new_deaths as float ))/sum(cast(New_Cases as float ))*100 as DeathPCT
from CovidDeath
where continent is not null
-- group by date
order by 1,2


--2

--Show Countries with Highest Death Count
select location,max(cast(new_deaths as int)) as TotalDeathCount
from CovidDeath
--where location like '%united states%'
where continent is null
and location not in ('World','European Union','International')
group by location
order by TotalDeathCount desc

--3
-- Countries with highest infection rates
select location,population,max(total_cases) as HighestInfectionCount, max((cast( total_cases as float))/cast(population as float))*100 as PctPopInfected
from CovidDeath
--where location like '%united states%'
group by location, population
order by PctPopInfected desc


-- 4 
select location,population,date, max(cast(total_cases as float)) as HighestInfectionCount, max((cast( total_cases as float))/cast(population as float))*100 as PctPopInfected
from CovidDeath
--where location like '%united states%'
group by location, population,date
order by PctPopInfected desc


-- Looking at total population vs vaccinations

select dea.continent,dea.location,dea.date,dea.population, cast(vac.new_vaccinations as integer)
,sum(vac.new_vaccinations) over (partition by dea.location order by dea.location,dea.date) as RollingPeopleVaccinated

from CovidDeath dea
join CovidVaccinations vac
    on dea.location=vac.location
    and dea.date=vac.date
where dea.continent is not null
order by 2,3
``` 


### Markdown

Markdown is a lightweight and easy-to-use syntax for styling your writing. It includes conventions for

```markdown
Syntax highlighted code block

# Header 1
## Header 2
### Header 3

- Bulleted
- List

1. Numbered
2. List

**Bold** and _Italic_ and `Code` text

[Link](url) and ![Image](src)
```

Tableau 
[Link](https://github.com/begen/Ben_Portfolio/blob/83d38b89f0bbfaebcee882a3248697060750fa70/Tableau%20Covid%20Dashboard.png)



For more details see [GitHub Flavored Markdown](https://guides.github.com/features/mastering-markdown/).

### Jekyll Themes

Your Pages site will use the layout and styles from the Jekyll theme you have selected in your [repository settings](https://github.com/begen/Ben_Portfolio/settings/pages). The name of this theme is saved in the Jekyll `_config.yml` configuration file.

### Support or Contact

Having trouble with Pages? Check out our [documentation](https://docs.github.com/categories/github-pages-basics/) or [contact support](https://support.github.com/contact) and we’ll help you sort it out.
