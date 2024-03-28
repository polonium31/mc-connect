# Seed Users
5.times do |n|
  user = User.create!(
    name: "User #{n + 1}",
    email: "user#{n + 1}@example.com",
    program_name: "Program #{n + 1}",
    department: "Department #{n + 1}",
    password: "password", # You might want to hash the password if needed
    instagram_link: "https://www.instagram.com/user#{n + 1}/",
    linkedin_link: "https://www.linkedin.com/in/user#{n + 1}/",
    facebook_link: "https://www.facebook.com/user#{n + 1}/",
    github_link: "https://github.com/user#{n + 1}",
    twitter_link: "https://twitter.com/user#{n + 1}"
  )
  
  # Seed Comments for each User
  2.times do
    user.comment_posts.create!(
      content: "This is a comment by #{user.name}",
      post_id: Post.pluck(:id).sample
    )
  end
end

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


# Seed Posts
User.all.each do |user|
  3.times do |n|
    post = user.posts.create!(
      title: "Post #{n + 1} by #{user.name}",
      content: "This is the content of post #{n + 1} by #{user.name}."
    )
    # Seed Comments for each Post
    2.times do
      post.comment_posts.create!(
        content: "This is a comment on post #{post.id} by #{user.name}",
        user_id: User.pluck(:id).sample
      )
    end
  end
end

# Seed UserSkills (Associations between users and skills)
User.all.each do |user|
  3.times do
    user.skills << Skill.all.sample
  end
end
