# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

skills = [
  "Ruby on Rails",
  "JavaScript",
  "React.js",
  "Vue.js",
  "Angular",
  "HTML",
  "CSS",
  "SQL",
  "Python",
  "Java",
  "C#",
  "PHP",
  "Node.js",
  "Express.js",
  "Django",
  "Flask",
  "Spring Boot",
  "ASP.NET",
  "Ruby",
  "TypeScript",
  "jQuery",
  "Bootstrap",
  "Sass",
  "Less",
  "MySQL",
  "PostgreSQL",
  "MongoDB",
  "SQLite",
  "Redis",
  "Docker",
  "Kubernetes",
  "Git",
  "Jenkins",
  "AWS",
  "Azure",
  "Google Cloud",
  "Heroku",
  "RESTful APIs",
  "GraphQL",
  "Microservices"
]


skills.each do |skill|
  Skill.create(name: skill)
end
