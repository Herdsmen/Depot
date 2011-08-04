# encoding: utf-8

Category.delete_all

# create root 
Category.create(:name => 'ROOT_NODE', :layer => 0, 
	:parent => -1)

# layer = 1
Category.create(:name => 'Study', :layer => 1, 
	:parent => Category.where(:name => 'ROOT_NODE').first.id)
Category.create(:name => 'Living', :layer => 1, 
	:parent => Category.where(:name => 'ROOT_NODE').first.id)
Category.create(:name => 'Fiction', :layer => 1,
	:parent => Category.where(:name => 'ROOT_NODE').first.id)

# layer = 2
Category.create(:name => 'Computers', :layer => 2, 
	:parent => Category.where(:name => 'Study').first.id)
Category.create(:name => 'Arts', :layer => 2,  
	:parent => Category.where(:name => 'Study').first.id)

Category.create(:name => 'Cooking', :layer => 2,  
	:parent => Category.where(:name => 'Living').first.id)
Category.create(:name => 'Health', :layer => 2,  
	:parent => Category.where(:name => 'Living').first.id)
Category.create(:name => 'Travel', :layer => 2,  
	:parent => Category.where(:name => 'Living').first.id)
	
Category.create(:name => 'Literature', :layer => 2, 
	:parent => Category.where(:name => 'Fiction').first.id)
Category.create(:name => 'Mystery', :layer => 2,  
	:parent => Category.where(:name => 'Fiction').first.id)
Category.create(:name => 'Classics', :layer => 2,  
	:parent => Category.where(:name => 'Fiction').first.id)
	
# layer = 3
Category.create(:name => 'Drinks', :layer => 3, 
	:parent => Category.where(:name => 'Cooking').first.id)


Product.delete_all
Product.create(:title => 'Web Design for Developers',
  :description => 
    %{<p>
        <em>Web Design for Developers</em> will show you how to make your
        web-based application look professionally designed. We'll help you
        learn how to pick the right colors and fonts, avoid costly interface
        and accessibility mistakes -- your application will really come alive.
        We'll also walk you through some common Photoshop and CSS techniques
        and work through a web site redesign, taking a new design from concept
        all the way to implementation.
      </p>},
  :image_url =>   '/images/wd4d.jpg',    
  :price => 42.95,
  :category_ids => [Category.where(:name => 'Computers').first.id])
# . . .
Product.create(:title => 'Programming Ruby 1.9',
  :description =>
    %{<p>
        Ruby is the fastest growing and most exciting dynamic language
        out there. If you need to get working programs delivered fast,
        you should add Ruby to your toolbox.
      </p>},
  :image_url => '/images/ruby.jpg',
  :price => 49.50,
  :category_ids => [Category.where(:name => 'Computers').first.id])
# . . .

Product.create(:title => 'Rails Test Prescriptions',
  :description => 
    %{<p>
        <em>Rails Test Prescriptions</em> is a comprehensive guide to testing
        Rails applications, covering Test-Driven Development from both a
        theoretical perspective (why to test) and from a practical perspective
        (how to test effectively). It covers the core Rails testing tools and
        procedures for Rails 2 and Rails 3, and introduces popular add-ons,
        including Cucumber, Shoulda, Machinist, Mocha, and Rcov.
      </p>},
  :image_url => '/images/rtp.jpg',
  :price => 43.75,
  :category_ids => [Category.where(:name => 'Computers').first.id])
# . . .

# Product.create(:title => '',
  # :description => 
    # %{<p>
        
      # </p>},
  # :image_url => '/images/.jpg',
  # :price => ,
  # :category_ids => [Category.where(:name => '').first.id])
#. . .

Product.create(:title => 'Art Age',
  :description => 
    %{<p>
        As fascinating as a real visit to the world's famous museums and architectural sites, 
		GARDNER'S ART THROUGH THE AGES: THE WESTERN PERSPECTIVE gives you a comprehensive, 
		beautifully illustrated tour of the world's great artistic traditions--plus all 
		the study tools you need to excel in your art history course! Easy to read and understand, 
		this 13th Edition of the most widely read history of art book in the English language is 
		the only textbook that includes a unique "scale" feature (accompanying the book's photographs 
		of paintings and other artworks) that will help you better visualize the actual size of the artworks shown in the book. 
      </p>},
  :image_url => '/images/art_ages.jpg',
  :price => 144.98,
  :category_ids => [Category.where(:name => 'Arts').first.id])
# . . .

Product.create(:title => 'Stress-Proof Your Life (52 Brilliant Ideas): Smart Ways to Relax and Re-energize',
  :description => 
    %{<p>
        Stress-proof your life is for the people who struggle to find time for a shower much less a bath. 
		It's for the ones who are still clicking their mouse or ironing a shirt at 11.30pm. 
		The ones who don't take their annual leave and worry that stress is affecting their health and relationships. 
		Or they would worry if they weren't so knackered and that report wasn't due in at 9am. 
		It's going to take a lot more than a candle-lit bubble bath to sort them out..." Elisabeth Wilson. 
		Stress is not a generic thing although it's always treated that way. 
		Some people are really good at avoiding some stresses without realising that they are slaves to another kind.
      </p>},
  :image_url => '/images/Stress_Proof.jpg',
  :price => 13.68,
  :category_ids => [Category.where(:name => 'Health').first.id])
# . . .
Product.create(:title => 'Lonely Planet Scotland',
  :description => 
    %{<p>
        "Like a fine single malt, Scotland is a connoisseur's delight - an intoxicating blend of stunning scenery and sophisticated cities, 
		of salt-tanged sea air and dark peaty waters, of outdoor adventure and deep history." - Neil Wilson, Lonely Planet writer
      </p>},
  :image_url => '/images/scotland.jpg',
  :price => 19.80,
  :category_ids => [Category.where(:name => 'Travel').first.id])
# . . .
Product.create(:title => "Miette: Recipes from San Francisco's Most Charming Pastry Shop",
  :description => 
    %{<p>
        Renowned for beautiful cakes and whimsical confections, 
		Miette Patisserie is among the most beloved of San Francisco's culinary destinations for locals and travelers. 
		Miette's pretty Parisian aesthetic enchants visitors with tables piled high with beribboned bags of gingersnaps, 
		homemade marshmallows, fleur de sel caramels, and rainbows of gumballs. This cookbook brings the enchantment home, 
		sharing 100 secret formulas for favorite Miette treats from chef and owner Meg Ray. 
      </p>},
  :image_url => '/images/recipes.jpg',
  :price => 16.21,
  :category_ids => [Category.where(:name => 'Cooking').first.id])
# . . .
Product.create(:title => 'Land of Plenty: A Treasury of Authentic Sichuan Cooking',
  :description => 
    %{<p>
        Sichuan cuisine, renowned for its spicy notes and hot flavors, is famous in Chinese history and lore for its variety and richness of tastes and layers. 
		Dunlop, who writes about Chinese food and culture for the Economist, has produced a volume that is sure to take its place among the classics of Chinese cuisine. 
      </p>},
  :image_url => '/images/sichuan_cooking.jpg',
  :price => 19.80,
  :category_ids => [Category.where(:name => 'Cooking').first.id])
# . . .
Product.create(:title => 'The Big Book of Juices',
  :description => 
    %{<p>
        With some 405 recipes for fruit and vegetable juices, smoothies, and quenchers, this newly updated and expanded edition of Natalie Savona's essential kitchen guide to juicing now offers health-conscious readers even more. 
		A clever indexing system sorts the juices by key ingredients, by nutrients, and by health benefits. 
		Plus, a simple five-star system rates the effectiveness of the drinks in boosting energy and detoxifying the body, as well as potential benefits for the immune system, digestion, and even skin quality.  
      </p>},
  :image_url => '/images/juices.jpg',
  :price => 13.57,
  :category_ids => [Category.where(:name => 'Drinks').first.id])
# . . .
Product.create(:title => 'The Nimrod',
  :description => 
    %{<p>
        Read THE NIMROD, the "brilliantly original and astonishingly funny book" from Mark Kelliher, a Hollywood veteran of the Farrelly Brothers/Jim Carrey & Renee Zellweger cult classic film "Me, Myself and Irene, "Bill Murray's "Osmosis Jones," Cartoon Network and countless publications. 
		A novel SOCO "New England's Favorite Magazine" recently featured to it's extensive multi-state readership for being: "sometimes sarcastic, sometimes outraged, always funny."
      </p>},
  :image_url => '/images/nimrod.jpg',
  :price => 14.99,
  :category_ids => [Category.where(:name => 'Mystery').first.id])
# . . .
Product.create(:title => 'Middlemarch',
  :description => 
    %{<p>
        Dorothea Brooke can find no acceptable outlet for her talents or energy and few who share her ideals. 
		As an upper middle-class woman in Victorian England she can't learn Greek or Latin simply for herself; she certainly can't become an architect or have a career; and thus, Dorothea finds herself "Saint Theresa of nothing."
      </p>},
  :image_url => '/images/middlemarch.jpg',
  :price => 19.99,
  :category_ids => [Category.where(:name => 'Classics').first.id])
# . . .
Product.create(:title => 'Little Women',
  :description => 
    %{<p>
        Laura Grafton is a precise reader, but her voice lacks expressiveness, and she makes little attempt to vocally differentiate (and/or animate) the characters. 
		The result is an inoffensive and slightly dull rendering. 
		There's nothing wrong; the tapes just won't grab the attention of the casual listener.
      </p>},
  :image_url => '/images/little_women.jpg',
  :price => 13.99,
  :category_ids => [Category.where(:name => 'Classics').first.id])
# . . .

Product.create(:title => "You've gone too far this time, Sir!",
  :description => 
    %{<p>
		Have you ever woken up in the sultry heat of the morning, your hair and beard teeming with maggots, and then had potatoes picked out of your ears? 
		Have you ever felt the cold barrel of a semi automatic gun against your forehead? 
		When Danny Bent cycled 15,000 kilometres from the UK to India to raise money for ActionAid, it was a decision that took twenty years and one minute. 
		For twenty years he had wanted to do something to raise money for charity. 
		The one minute was when as their teacher he was put on the spot by his pupils and declared that the means was by bike, and he was going to India.
      </p>},
  :image_url => '/images/gone_too_far.jpg',
  :price => 11.99,
  :category_ids => [Category.where(:name => 'Travel').first.id])
#. . .