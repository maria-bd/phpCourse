CREATE database edu;

USE edu;

CREATE TABLE admin (
    admin_id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(255) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL
);

CREATE TABLE user (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    link VARCHAR(255),
    bio TEXT,
    location VARCHAR(255)
);

CREATE TABLE coach (
    coach_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    lastname VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    link VARCHAR(255),
    bio TEXT
);

CREATE TABLE training (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(255),
	wilaya VARCHAR(255),
    domain VARCHAR(255),
    name VARCHAR(255),
    description TEXT,
    company_name VARCHAR(255),
    company_description TEXT,
    duration INT,
    date DATE,
    link VARCHAR(255),
    price DECIMAL(10, 2),
    teacher_name VARCHAR(255),
    teacher_description TEXT
);

CREATE TABLE stage (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    location VARCHAR(255),
    domain VARCHAR(255),
	wilaya VARCHAR(255),
    name VARCHAR(255),
    description TEXT,
    company_name VARCHAR(255),
    company_description TEXT,
    duration INT,
    date DATE,
    link VARCHAR(255),
    type VARCHAR(255),
    encadreur_name VARCHAR(255),
    encadreur_description TEXT
);

CREATE TABLE event (
    activity_id INT PRIMARY KEY AUTO_INCREMENT,
    wilaya VARCHAR(255),
    domain VARCHAR(255),
    location VARCHAR(255),
    name VARCHAR(255),
    description TEXT,
    company_name VARCHAR(255),
    company_description TEXT,
    duration INT,
    date DATE,
    link VARCHAR(255),
    agenda TEXT,
    details TEXT
);

CREATE TABLE have (
    link_id INT PRIMARY KEY AUTO_INCREMENT,
    activity_id INT,
    coach_id INT,
    FOREIGN KEY (activity_id) REFERENCES training(activity_id) ,
    FOREIGN KEY (activity_id) REFERENCES stage(activity_id) ,
    FOREIGN KEY (activity_id) REFERENCES event(activity_id) ,
    FOREIGN KEY (coach_id) REFERENCES coach(coach_id) 
);

CREATE TABLE contact (
    name VARCHAR(255),
    email VARCHAR(255),
    subject VARCHAR(255),
    message VARCHAR(255)
);


INSERT INTO training (location, wilaya, domain, name, description, company_name, company_description, duration, date, link, price, teacher_name, teacher_description) VALUES
('http://maps.example.com/Algiers', 'Alger', 'biology', 'Biology Basics Workshop', 'A workshop covering fundamental concepts in biology.', 'BioTech Solutions', 'Leading provider of biotechnology solutions.', 4, '2024-04-10', 'http://example.com/biology-workshop', 50.00, 'Dr. Sarah Johnson', 'Dr. Johnson holds a Ph.D. in Biology and has extensive teaching experience.'),
('http://maps.example.com/Oran', 'Alger', 'biology', 'Advanced Genetics Seminar', 'An in-depth seminar exploring advanced topics in genetics.', 'GeneGenie Research', 'Pioneers in genetic research and development.', 6, '2024-05-15', 'http://example.com/genetics-seminar', 75.00, 'Prof. Michael Smith', 'Prof. Smith is a renowned geneticist with numerous publications.'),
('http://maps.example.com/Blida', 'Blida', 'design', 'Graphic Design Masterclass', 'A comprehensive masterclass on graphic design principles and techniques.', 'DesignWorks Academy', 'Leading design education institution.', 8, '2024-06-20', 'http://example.com/graphic-design-masterclass', 100.00, 'Emily Davis', 'Emily is an award-winning graphic designer with over a decade of industry experience.'),
('http://maps.example.com/Boumerdes', 'Blida', 'design', 'Web Design Bootcamp', 'Intensive training program covering modern web design trends and tools.', 'WebTech Institute', 'Specialists in web technology education.', 10, '2024-07-25', 'http://example.com/web-design-bootcamp', 120.00, 'John Roberts', 'John is a seasoned web developer and instructor with a passion for design.'),
('http://maps.example.com/Tizi-Ouzou', 'Blida', 'physics', 'Quantum Mechanics Workshop', 'Explore the fascinating world of quantum mechanics in this hands-on workshop.', 'Quantum Insights', 'Dedicated to advancing understanding of quantum phenomena.', 6, '2024-08-30', 'http://example.com/quantum-mechanics-workshop', 80.00, 'Dr. Alex Chen', 'Dr. Chen is a theoretical physicist specializing in quantum theory.'),
('http://maps.example.com/Constantine', 'Blida', 'physics', 'Astrophysics Symposium', 'Delve into the mysteries of the universe with leading astrophysicists.', 'Stellar Science Society', 'Promoting excellence in astrophysical research.', 8, '2024-09-30', 'http://example.com/astrophysics-symposium', 110.00, 'Prof. Rachel Adams', 'Prof. Adams is an esteemed astrophysicist with numerous accolades.'),
('http://maps.example.com/Algiers', 'Blida', 'computer science', 'Introduction to Python Programming', 'Learn the fundamentals of Python programming language.', 'CodeMasters Academy', 'Empowering individuals through coding education.', 6, '2024-10-10', 'http://example.com/python-programming-intro', 70.00, 'David Lee', 'David is a software engineer with extensive Python experience.'),
('http://maps.example.com/Oran', 'Blida', 'computer science', 'Machine Learning Workshop', 'Hands-on workshop on machine learning algorithms and techniques.', 'MLTech Solutions', 'Driving innovation through machine learning.', 8, '2024-11-15', 'http://example.com/machine-learning-workshop', 90.00, 'Dr. Sophia Wang', 'Dr. Wang is a leading expert in machine learning research.'),
('http://maps.example.com/Blida', 'Médéa', 'marketing', 'Digital Marketing Bootcamp', 'Comprehensive bootcamp covering digital marketing strategies.', 'MarketPro Academy', 'Leaders in digital marketing education.', 10, '2024-12-20', 'http://example.com/digital-marketing-bootcamp', 120.00, 'Mark Roberts', 'Mark is a seasoned marketer with expertise in online advertising.'),
('http://maps.example.com/Chlef', 'Médéa', 'marketing', 'Social Media Marketing Seminar', 'Learn effective strategies for leveraging social media platforms.', 'SocialBuzz Consulting', 'Specialists in social media marketing solutions.', 6, '2025-01-25', 'http://example.com/social-media-marketing-seminar', 80.00, 'Emma Johnson', 'Emma is a social media strategist with a track record of successful campaigns.'),
('http://maps.example.com/Alger', 'Médéa', 'soft skills', 'Leadership Development Workshop', 'Develop essential leadership skills for professional success.', 'LeadRight Solutions', 'Empowering leaders to reach their full potential.', 8, '2025-02-28', 'http://example.com/leadership-development-workshop', 100.00, 'Dr. Adam Taylor', 'Dr. Taylor is a leadership coach with experience in various industries.'),
('http://maps.example.com/Setif', 'Médéa', 'soft skills', 'Effective Communication Training', 'Enhance communication skills for better personal and professional relationships.', 'CommuniSkills Institute', 'Experts in communication training and development.', 6, '2025-03-30', 'http://example.com/effective-communication-training', 80.00, 'Sarah Adams', 'Sarah is a communication specialist with a passion for teaching.'),
('http://maps.example.com/Tlemcen', 'Médéa', 'e-commerce', 'E-Commerce Strategy Workshop', 'Learn strategies for building and growing a successful e-commerce business.', 'EcomPro Solutions', 'Your partner in e-commerce success.', 8, '2025-04-10', 'http://example.com/ecommerce-strategy-workshop', 110.00, 'Chris Evans', 'Chris is an e-commerce expert with experience in online retailing.'),
('http://maps.example.com/Bejaia', 'Médéa', 'e-commerce', 'Amazon FBA Masterclass', 'Master the ins and outs of selling on Amazon using the FBA model.', 'FBA Success Academy', 'Unlock your potential with Amazon FBA.', 6, '2025-05-15', 'http://example.com/amazon-fba-masterclass', 90.00, 'Lisa Roberts', 'Lisa is a successful Amazon seller and FBA expert.'),
('http://maps.example.com/Annaba', 'Médéa', 'language', 'Spanish Language Intensive Course', 'Immerse yourself in the Spanish language with this intensive course.', 'LanguageLinx Institute', 'Your gateway to language proficiency.', 10, '2025-06-20', 'http://example.com/spanish-language-course', 120.00, 'Maria Garcia', 'Maria is a native Spanish speaker and experienced language instructor.'),
('http://maps.example.com/Batna', 'Médéa', 'language', 'Business English Workshop', 'Enhance your English language skills for professional communication.', 'BizTalk Training', 'Specialists in business communication skills.', 8, '2025-07-25', 'http://example.com/business-english-workshop', 100.00, 'John Smith', 'John is a certified English language teacher with corporate training experience.');

INSERT INTO stage (location, domain, wilaya, name, description, company_name, company_description, duration, date, link, type, encadreur_name, encadreur_description) VALUES
('http://maps.example.com/Algiers', 'biology', 'Alger', 'Biology Basics Stage', 'A stage covering fundamental concepts in biology.', 'BioTech Solutions', 'Leading provider of biotechnology solutions.', 4, '2024-04-10', 'http://example.com/biology-stage', 'Research', 'Dr. Sarah Johnson', 'Dr. Johnson holds a Ph.D. in Biology and has extensive research experience.'),
('http://maps.example.com/Oran', 'biology', 'Alger', 'Advanced Genetics Stage', 'An in-depth stage exploring advanced topics in genetics.', 'GeneGenie Research', 'Pioneers in genetic research and development.', 6, '2024-05-15', 'http://example.com/genetics-stage', 'Research', 'Prof. Michael Smith', 'Prof. Smith is a renowned geneticist with numerous publications.'),
('http://maps.example.com/Blida', 'design', 'Blida', 'Graphic Design Stage', 'A comprehensive stage on graphic design principles and techniques.', 'DesignWorks Agency', 'Leading design agency.', 8, '2024-06-20', 'http://example.com/graphic-design-stage', 'Workshop', 'Emily Davis', 'Emily is an award-winning graphic designer with over a decade of industry experience.'),
('http://maps.example.com/Boumerdes', 'design', 'Blida', 'Web Design Stage', 'Intensive training stage covering modern web design trends and tools.', 'WebTech Solutions', 'Specialists in web technology education.', 10, '2024-07-25', 'http://example.com/web-design-stage', 'Workshop', 'John Roberts', 'John is a seasoned web developer with a passion for design.'),
('http://maps.example.com/Tizi-Ouzou', 'physics', 'Blida', 'Quantum Mechanics Stage', 'Explore the fascinating world of quantum mechanics in this hands-on stage.', 'Quantum Insights', 'Dedicated to advancing understanding of quantum phenomena.', 6, '2024-08-30', 'http://example.com/quantum-mechanics-stage', 'Workshop', 'Dr. Alex Chen', 'Dr. Chen is a theoretical physicist specializing in quantum theory.'),
('http://maps.example.com/Constantine', 'physics', 'Blida', 'Astrophysics Stage', 'Delve into the mysteries of the universe with leading astrophysicists.', 'Stellar Science Society', 'Promoting excellence in astrophysical research.', 8, '2024-09-30', 'http://example.com/astrophysics-stage', 'Seminar', 'Prof. Rachel Adams', 'Prof. Adams is an esteemed astrophysicist with numerous accolades.'),
('http://maps.example.com/Algiers', 'computer science', 'Alger', 'Python Programming Stage', 'Learn the fundamentals of Python programming language.', 'CodeMasters Academy', 'Empowering individuals through coding education.', 6, '2024-10-10', 'http://example.com/python-programming-stage', 'Workshop', 'David Lee', 'David is a software engineer with extensive Python experience.'),
('http://maps.example.com/Oran', 'computer science', 'Blida', 'Machine Learning Stage', 'Hands-on stage on machine learning algorithms and techniques.', 'MLTech Solutions', 'Driving innovation through machine learning.', 8, '2024-11-15', 'http://example.com/machine-learning-stage', 'Workshop', 'Dr. Sophia Wang', 'Dr. Wang is a leading expert in machine learning research.'),
('http://maps.example.com/Blida', 'marketing', 'Médéa', 'Digital Marketing Stage', 'Comprehensive stage covering digital marketing strategies.', 'MarketPro Academy', 'Leaders in digital marketing education.', 10, '2024-12-20', 'http://example.com/digital-marketing-stage', 'Bootcamp', 'Mark Roberts', 'Mark is a seasoned marketer with expertise in online advertising.'),
('http://maps.example.com/Chlef', 'marketing', 'Médéa', 'Social Media Marketing Stage', 'Learn effective strategies for leveraging social media platforms.', 'SocialBuzz Consulting', 'Specialists in social media marketing solutions.', 6, '2025-01-25', 'http://example.com/social-media-marketing-stage', 'Seminar', 'Emma Johnson', 'Emma is a social media strategist with a track record of successful campaigns.'),
('http://maps.example.com/Alger', 'soft skills', 'Médéa', 'Leadership Development Stage', 'Develop essential leadership skills for professional success.', 'LeadRight Solutions', 'Empowering leaders to reach their full potential.', 8, '2025-02-28', 'http://example.com/leadership-development-stage', 'Workshop', 'Dr. Adam Taylor', 'Dr. Taylor is a leadership coach with experience in various industries.'),
('http://maps.example.com/Setif', 'soft skills', 'Médéa', 'Effective Communication Stage', 'Enhance communication skills for better personal and professional relationships.', 'CommuniSkills Institute', 'Experts in communication training and development.', 6, '2025-03-30', 'http://example.com/effective-communication-stage', 'Training', 'Sarah Adams', 'Sarah is a communication specialist with a passion for teaching.'),
('http://maps.example.com/Tlemcen', 'e-commerce', 'Médéa', 'E-Commerce Strategy Stage', 'Learn strategies for building and growing a successful e-commerce business.', 'EcomPro Solutions', 'Your partner in e-commerce success.', 8, '2025-04-10', 'http://example.com/ecommerce-strategy-stage', 'Workshop', 'Chris Evans', 'Chris is an e-commerce expert with experience in online retailing.'),
('http://maps.example.com/Bejaia', 'e-commerce', 'Médéa', 'Amazon FBA Stage', 'Master the ins and outs of selling on Amazon using the FBA model.', 'FBA Success Academy', 'Unlock your potential with Amazon FBA.', 6, '2025-05-15', 'http://example.com/amazon-fba-stage', 'Workshop', 'Lisa Roberts', 'Lisa is a successful Amazon seller and FBA expert.'),
('http://maps.example.com/Annaba', 'language', 'Médéa', 'Spanish Language Stage', 'Immerse yourself in the Spanish language with this intensive stage.', 'LanguageLinx Institute', 'Your gateway to language proficiency.', 10, '2025-06-20', 'http://example.com/spanish-language-stage', 'Intensive Course', 'Maria Garcia', 'Maria is a native Spanish speaker and experienced language instructor.'),
('http://maps.example.com/Batna', 'language', 'Médéa', 'Business English Stage', 'Enhance your English language skills for professional communication.', 'BizTalk Training', 'Specialists in business communication skills.', 8, '2025-07-25', 'http://example.com/business-english-stage', 'Workshop', 'John Smith', 'John is a certified English language teacher with corporate training experience.');


INSERT INTO event (wilaya, domain, location, name, description, company_name, company_description, duration, date, link, agenda, details) VALUES
('Alger', 'biology', 'http://maps.example.com/Algiers', 'Biology Symposium', 'A symposium covering various topics in biology.', 'BioTech Solutions', 'Leading provider of biotechnology solutions.', 1, '2024-04-20', 'http://example.com/biology-symposium', '09:00 - 10:00: Registration\n10:00 - 12:00: Keynote Speeches\n12:00 - 13:00: Lunch Break\n13:00 - 15:00: Panel Discussions\n15:00 - 16:00: Networking Session', 'Speakers and panelists will discuss recent advancements in biology research.'),
('Blida', 'design', 'http://maps.example.com/Blida', 'Design Conference', 'An annual conference showcasing innovative designs.', 'DesignWorks Agency', 'Leading design agency.', 2, '2024-06-30', 'http://example.com/design-conference', '09:30 - 10:30: Registration\n10:30 - 12:30: Keynote Presentations\n12:30 - 13:30: Lunch\n13:30 - 15:30: Workshops\n15:30 - 16:30: Closing Remarks', 'Experts will share insights on the latest trends in design.'),
('Médéa', 'marketing', 'http://maps.example.com/Médéa', 'Marketing Expo', 'An expo featuring the latest trends in marketing strategies.', 'MarketPro Expo', 'Showcasing innovative marketing solutions.', 1, '2024-07-10', 'http://example.com/marketing-expo', '10:00 - 11:00: Exhibition Opening\n11:00 - 13:00: Product Demonstrations\n13:00 - 14:00: Networking Lunch\n14:00 - 16:00: Interactive Workshops', 'Explore new marketing tools and techniques with industry experts.'),
('Alger', 'computer science', 'http://maps.example.com/Algiers', 'Tech Summit', 'A summit bringing together tech enthusiasts and professionals.', 'TechVision', 'Driving innovation in the tech industry.', 2, '2024-08-15', 'http://example.com/tech-summit', '09:00 - 10:00: Registration\n10:00 - 12:00: Keynote Speeches\n12:00 - 13:00: Lunch Break\n13:00 - 15:00: Panel Discussions\n15:00 - 16:00: Networking Session', 'Engage with leaders in the technology sector and explore emerging trends.'),
('Médéa', 'e-commerce', 'http://maps.example.com/Médéa', 'E-Commerce Expo', 'An expo focusing on e-commerce trends and innovations.', 'EcomExpo', 'Showcasing the future of online retailing.', 1, '2024-09-05', 'http://example.com/ecommerce-expo', '10:00 - 11:00: Exhibition Opening\n11:00 - 13:00: Product Demonstrations\n13:00 - 14:00: Networking Lunch\n14:00 - 16:00: Interactive Workshops', 'Discover the latest tools and strategies for e-commerce success.'),
('Alger', 'language', 'http://maps.example.com/Algiers', 'Language Festival', 'A festival celebrating linguistic diversity and language learning.', 'LingoFest', 'Promoting multiculturalism through language.', 2, '2024-10-20', 'http://example.com/language-festival', '09:30 - 10:30: Opening Ceremony\n10:30 - 12:30: Language Workshops\n12:30 - 13:30: Cultural Performances\n13:30 - 15:30: Language Exchange\n15:30 - 16:30: Closing Ceremony', 'Join us for a day of language exploration and cultural exchange.'),('Blida', 'biology', 'http://maps.example.com/Blida', 'Genetics Conference', 'A conference focusing on recent advancements in genetics research.', 'GenoTech', 'Leading the way in genetic research and innovation.', 2, '2024-12-05', 'http://example.com/genetics-conference', '09:00 - 10:00: Registration\n10:00 - 12:00: Keynote Presentations\n12:00 - 13:00: Lunch Break\n13:00 - 14:30: Panel Discussions\n14:30 - 15:00: Coffee Break\n15:00 - 16:30: Workshops', 'Explore the latest breakthroughs in genetics and their implications.'),
('Médéa', 'design', 'http://maps.example.com/Médéa', 'Product Design Workshop', 'A workshop focusing on the principles and practices of product design.', 'ProductCraft', 'Crafting innovative products through design thinking.', 1, '2025-01-15', 'http://example.com/product-design-workshop', '10:00 - 12:00: Introduction to Product Design\n12:00 - 13:00: Lunch Break\n13:00 - 15:00: Prototyping Workshop\n15:00 - 16:00: Design Critique', 'Learn how to create user-centric products through hands-on exercises.'),
('Alger', 'marketing', 'http://maps.example.com/Algiers', 'Social Media Marketing Workshop', 'A workshop focusing on strategies for effective social media marketing.', 'Socialize Marketing', 'Driving brand engagement through social media.', 2, '2025-02-20', 'http://example.com/social-media-marketing-workshop', '09:30 - 10:00: Registration\n10:00 - 11:30: Social Media Strategies\n11:30 - 12:00: Coffee Break\n12:00 - 13:30: Content Creation\n13:30 - 14:30: Lunch\n14:30 - 16:00: Analytics and Optimization', 'Master the art of social media marketing with expert guidance.'),
('Blida', 'computer science', 'http://maps.example.com/Blida', 'Cybersecurity Conference', 'A conference discussing emerging trends and challenges in cybersecurity.', 'SecureTech', 'Protecting digital assets through cutting-edge cybersecurity solutions.', 3, '2025-03-10', 'http://example.com/cybersecurity-conference', '09:00 - 10:00: Registration\n10:00 - 12:00: Keynote Presentations\n12:00 - 13:00: Lunch Break\n13:00 - 14:30: Technical Sessions\n14:30 - 15:00: Coffee Break\n15:00 - 16:30: Panel Discussion', 'Stay ahead of cyber threats with insights from cybersecurity experts.'),
('Médéa', 'e-commerce', 'http://maps.example.com/Médéa', 'Digital Payment Summit', 'A summit exploring innovations and challenges in digital payments.', 'PaymentTech Summit', 'Shaping the future of digital transactions.', 2, '2025-04-15', 'http://example.com/digital-payment-summit', '09:30 - 10:00: Registration\n10:00 - 11:30: Keynote Presentations\n11:30 - 12:00: Coffee Break\n12:00 - 13:30: Panel Discussions\n13:30 - 14:30: Lunch\n14:30 - 16:00: Workshops', 'Explore the latest trends and technologies in digital payments.'),
('Alger', 'language', 'http://maps.example.com/Algiers', 'Language Learning Workshop', 'A workshop offering practical techniques for language learning.', 'Polyglot Academy', 'Empowering language learners with effective strategies.', 1, '2025-05-20', 'http://example.com/language-learning-workshop', '10:00 - 11:30: Language Learning Strategies\n11:30 - 12:00: Coffee Break\n12:00 - 13:30: Language Practice Sessions\n13:30 - 14:30: Lunch\n14:30 - 16:00: Q&A Session', 'Accelerate your language learning journey with proven methods.'), ('Alger', 'biology', 'http://maps.example.com/Algiers', 'Biology Conference', 'An international conference on cutting-edge biological research.', 'BioTech Innovations', 'Pioneering breakthroughs in biotechnology.', 3, '2024-04-22', 'http://example.com/biology-conference', '08:30 - 09:00: Registration\n09:00 - 10:30: Plenary Session\n10:30 - 11:00: Coffee Break\n11:00 - 12:30: Concurrent Sessions\n12:30 - 14:00: Lunch\n14:00 - 15:30: Poster Presentations\n15:30 - 16:00: Closing Ceremony', 'Join us to explore the latest discoveries in biology.'),
('Blida', 'design', 'http://maps.example.com/Blida', 'UX/UI Workshop', 'A hands-on workshop focusing on user experience and interface design.', 'DesignHub', 'Shaping user-centric digital experiences.', 1, '2024-07-20', 'http://example.com/ux-ui-workshop', '10:00 - 12:00: Introduction to UX/UI\n12:00 - 13:00: Lunch Break\n13:00 - 15:00: Wireframing Workshop\n15:00 - 16:00: Q&A Session', 'Learn practical techniques for designing compelling user interfaces.'),
('Médéa', 'marketing', 'http://maps.example.com/Médéa', 'Digital Marketing Summit', 'A summit exploring the latest trends and strategies in digital marketing.', 'DigitalEdge Agency', 'Driving digital transformation through innovative marketing.', 2, '2024-08-05', 'http://example.com/digital-marketing-summit', '09:00 - 10:00: Registration\n10:00 - 11:30: Keynote Presentations\n11:30 - 12:00: Coffee Break\n12:00 - 13:30: Panel Discussions\n13:30 - 14:30: Lunch\n14:30 - 16:00: Workshops', 'Discover how to leverage digital channels for marketing success.'),
('Alger', 'computer science', 'http://maps.example.com/Algiers', 'Artificial Intelligence Symposium', 'A symposium focusing on the advancements and applications of artificial intelligence.', 'AI Solutions', 'Empowering businesses with AI-driven solutions.', 2, '2024-09-15', 'http://example.com/ai-symposium', '10:00 - 10:30: Registration\n10:30 - 12:00: Keynote Speeches\n12:00 - 13:00: Lunch Break\n13:00 - 14:30: Technical Sessions\n14:30 - 15:00: Coffee Break\n15:00 - 16:30: Panel Discussion', 'Explore the transformative potential of artificial intelligence.'),
('Médéa', 'e-commerce', 'http://maps.example.com/Médéa', 'Retail Innovation Forum', 'A forum exploring the latest innovations and strategies in retail.', 'RetailTech Forum', 'Shaping the future of retail through technology.', 1, '2024-10-10', 'http://example.com/retail-innovation-forum', '09:30 - 10:00: Registration\n10:00 - 11:30: Keynote Presentations\n11:30 - 12:00: Coffee Break\n12:00 - 13:30: Panel Discussions\n13:30 - 14:30: Lunch\n14:30 - 16:00: Interactive Sessions', 'Discover innovative technologies revolutionizing the retail sector.'),
('Alger', 'language', 'http://maps.example.com/Algiers', 'Translation Workshop', 'A workshop focusing on techniques and challenges in translation.', 'TranslateTech', 'Empowering global communication through translation technology.', 2, '2024-11-20', 'http://example.com/translation-workshop', '10:00 - 10:30: Registration\n10:30 - 12:00: Translation Techniques\n12:00 - 13:00: Lunch Break\n13:00 - 14:30: Practical Exercises\n14:30 - 15:00: Coffee Break\n15:00 - 16:30: Q&A Session', 'Enhance your translation skills with practical insights and exercises.');

UPDATE training 
SET price = CASE 
    WHEN name = 'Biology Basics Workshop' THEN 1200.00
    WHEN name = 'Advanced Genetics Seminar' THEN 2000.00
    WHEN name = 'Graphic Design Masterclass' THEN 3000.00
    WHEN name = 'Web Design Bootcamp' THEN 1500.00
    WHEN name = 'Introduction to Python Programming' THEN 2500.00
    WHEN name = 'Machine Learning Workshop' THEN 1800.00
    WHEN name = 'Digital Marketing Bootcamp' THEN 2800.00
    WHEN name = 'Social Media Marketing Seminar' THEN 2100.00
    WHEN name = 'Leadership Development Workshop' THEN 2200.00
    WHEN name = 'Effective Communication Training' THEN 1300.00
    ELSE price 
END,
duration = CASE 
    WHEN name IN ('Biology Basics Workshop', 'Advanced Genetics Seminar', 'Introduction to Python Programming', 'Machine Learning Workshop', 'Social Media Marketing Seminar', 'Leadership Development Workshop', 'Effective Communication Training') THEN 30
    ELSE 40
END;

