# encoding: utf-8

Category.delete_all
Category.create :name => "ROOT_NODE",
						:parent => -1,
						:layer => 0
# create root 
Category.create(:name => 'ROOT_NODE', :layer => 0, 
	:parent => -1)

# layer = 1
Category.create(:name => 'Study', :layer => 1, 
	:parent => Category.where(:name => 'ROOT_NODE').first.id)
Category.create(:name => 'Living', :layer => 1, 
	:parent => Category.where(:name => 'ROOT_NODE').first.id)
Category.create(:name => 'Literature', :layer => 1,
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
	
Category.create(:name => 'Fiction', :layer => 2, 
	:parent => Category.where(:name => 'Literature').first.id)

	
# layer = 3
Category.create(:name => 'Drinks', :layer => 3, 
	:parent => Category.where(:name => 'Cooking').first.id)
Category.create(:name => 'Mystery', :layer => 3,  
	:parent => Category.where(:name => 'Fiction').first.id)
Category.create(:name => 'Classics', :layer => 3,  
	:parent => Category.where(:name => 'Fiction').first.id)
	

Product.delete_all
User.delete_all
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
  :category_ids => [Category.where(:name => 'Computers').first.id],
  :heat => 2546)

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
  :category_ids => [Category.where(:name => 'Computers').first.id],
  :heat => 2012)

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
  :category_ids => [Category.where(:name => 'Computers').first.id],
   :heat => 1342)
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
  :category_ids => [Category.where(:name => 'Arts').first.id],
    :heat => 4523)
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
  :category_ids => [Category.where(:name => 'Health').first.id],
    :heat => 1236)
# . . .
Product.create(:title => 'Lonely Planet Scotland',
  :description => 
    %{<p>
        "Like a fine single malt, Scotland is a connoisseur's delight - an intoxicating blend of stunning scenery and sophisticated cities, 
		of salt-tanged sea air and dark peaty waters, of outdoor adventure and deep history." - Neil Wilson, Lonely Planet writer
      </p>},
  :image_url => '/images/scotland.jpg',
  :price => 19.80,
  :category_ids => [Category.where(:name => 'Travel').first.id],
    :heat => 235)
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
  :category_ids => [Category.where(:name => 'Cooking').first.id],
    :heat => 5324)
# . . .
Product.create(:title => 'Land of Plenty: A Treasury of Authentic Sichuan Cooking',
  :description => 
    %{<p>
        Sichuan cuisine, renowned for its spicy notes and hot flavors, is famous in Chinese history and lore for its variety and richness of tastes and layers. 
		Dunlop, who writes about Chinese food and culture for the Economist, has produced a volume that is sure to take its place among the classics of Chinese cuisine. 
      </p>},
  :image_url => '/images/sichuan_cooking.jpg',
  :price => 19.80,
  :category_ids => [Category.where(:name => 'Cooking').first.id],
    :heat => 574)
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
  :category_ids => [Category.where(:name => 'Drinks').first.id],
    :heat => 4672)
# . . .
Product.create(:title => 'The Nimrod',
  :description => 
    %{<p>
        Read THE NIMROD, the "brilliantly original and astonishingly funny book" from Mark Kelliher, a Hollywood veteran of the Farrelly Brothers/Jim Carrey & Renee Zellweger cult classic film "Me, Myself and Irene, "Bill Murray's "Osmosis Jones," Cartoon Network and countless publications. 
		A novel SOCO "New England's Favorite Magazine" recently featured to it's extensive multi-state readership for being: "sometimes sarcastic, sometimes outraged, always funny."
      </p>},
  :image_url => '/images/nimrod.jpg',
  :price => 14.99,
  :category_ids => [Category.where(:name => 'Mystery').first.id],
    :heat => 3526)
# . . .
Product.create(:title => 'Middlemarch',
  :description => 
    %{<p>
        Dorothea Brooke can find no acceptable outlet for her talents or energy and few who share her ideals. 
		As an upper middle-class woman in Victorian England she can't learn Greek or Latin simply for herself; she certainly can't become an architect or have a career; and thus, Dorothea finds herself "Saint Theresa of nothing."
      </p>},
  :image_url => '/images/middlemarch.jpg',
  :price => 19.99,
  :category_ids => [Category.where(:name => 'Classics').first.id],
    :heat => 1234)
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
  :category_ids => [Category.where(:name => 'Classics').first.id],
    :heat => 3572)
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
  :category_ids => [Category.where(:name => 'Travel').first.id],
  :heat => 935)


Product.create(:title => 'Debug it',
  :description => 
    %{<p>
        This book distills decades of hard-won experience gained in 
        the trenches of professional software development, giving you a head-start and 
        arming you with the tools you need to get to the bottom of the problem, whatever 
        you're faced with. Whether you're writing Java or assembly language, targeting 
        servers or embedded micro-controllers, using agile or traditional approaches, 
        the same basic bug-fixing principles apply. From constructing software that is 
        easy to debug (and incidentally less likely to contain bugs in the first place), 
        through handling bug reports to rolling out your ultimate fix, we'll cover the 
        entire life-cycle of a bug. You'll learn about the empirical approach, which 
        leverages your software's unique ability to show you what's really happening, 
        the importance of finding a reliable and convenient means of reproducing a bug, 
        and common pitfalls so you can avoid them. You'll see how to use commonly available 
        tools to automatically detect problems before they're reported by customers and 
        how to construct "transparent software" that provides access to critical information 
        and internal state. 
      </p>},
  :image_url => '/images/debug.jpg',
  :price => 45.76,
  :heat => 1362,
  :category_ids => [Category.where(:name => 'Computers').first.id])
  
Product.create(:title => 'Lonely Planet Australia',
  :description => 
    %{<p>
        No one knows Australia like Lonely Planet…remember, we live here! We know where 
        Sydney's best surf beaches are, where to get the best coffee in Melbourne's 
        cobbled lanes, and how to cross the great red plains in a van without getting 
        scorched.Lonely Planet guides are written by experts who get to the heart of 
        every destination they visit. This fully updated edition is packed with accurate, 
        practical and honest advice, designed to give you the information you need to make 
        the most of your trip.In This Guide:Full Coverage. Bustling cities, outback trails 
        and everything in between.Road Atlas. 16-page color map section, to navigate the 
        country's highways and byways Unique Green Index to help make your travels as 
        ecofriendly as you wish.
      </p>},
  :image_url => '/images/LPA.jpg',
  :price => 36.78,
  :heat => 625,
  :category_ids => [Category.where(:name => 'Travel').first.id])
  
Product.create(:title => 'Australia',
  :description => 
    %{<p>
        Feel the wind in your hair as you cruise the world's longest road; tips for 
        driving across this magnificent, monster country.Find out where Lonely Planet's 
        favorite Australians would rather be.Seek refuge in Cape Tribulation's Wet Tropics 
        where the rainforest greets the sea.Join the dots; hear about Aboriginal culture 
        from Australia's first people。In This Guide:12 intrepid authors, over 70 weeks 
        on-the-road research, 204 maps, one possum in a tent.Wine regions boxed and 
        packaged, brilliant food in every state, decent coffee every 300kms!Visit 
        lonelyplanet.com for reviews, daily updates and traveler suggestions.
      </p>},
  :image_url => '/images/Australia.jpg',
  :price => 37.78,
  :heat => 4213,
  :category_ids => [Category.where(:name => 'Travel').first.id])
  
Product.create(:title => 'Pride and Prejudice',
  :description => 
    %{<p>
        Wordsworth Classics are inexpensive editions designed to appeal to the general 
        reader and students. We commissioned teachers and specialists to write wide 
        ranging, jargon-free introductions and to provide notes that would assist the 
        understanding of our readers rather than interpret the stories for them. In the 
        same spirit, because the pleasures of reading are inseparable from the surprises, 
        secrets and revelations that all narratives contain, we strongly advise you to 
        enjoy this book before turning to the Introduction. 
      </p>},
  :image_url => '/images/PAP.jpg',
  :price => 16.58,
  :heat => 2625,
  :category_ids => [Category.where(:name => 'Study').first.id])
  
Product.create(:title => 'The Complete Sherlock Holmes: All 4 Novels and 56 Short Stories',
  :description => 
    %{<p>
        This volume, authorized by Sir Arthur Conan Doyle's estate, contains all 4 
        full-length novels and all 56 short stories featuring Sherlock Holmes. At over a 
        thousand pages, the weighty tome is a perfect gift for budding amateur sleuths, 
        and it is an ideal companion for a long stay on a desert island (or a leisurely 
        trip through the English countryside). As the reader wades past the tense 
        introductions of A Study in Scarlet and moves towards such classic tales as The 
        Hound of the Baskervilles, "The Adventure of the Speckled Band," and "The Final 
        Problem," she is sure to draw her own conclusions about Holmes's veiled past and 
        his quirky relationship with his "Boswell," Watson. Doyle never revealed much 
        about Holmes's early life, but the joy of reading the complete Holmes is assembling 
        the trivia of each story into something like a portrait of the detective and his 
        creator. By the end of the long journey through London and across Europe (with a 
        long stopover at Reichenbach Falls), one is apt to have found a friend for life. 
      </p>},
  :image_url => '/images/Sherlock.jpg',
  :price => 37.70,
  :heat => 563,
  :category_ids => [Category.where(:name => 'Fiction').first.id])
  
Product.create(:title => 'Plays of Oscar Wilde',
  :description => 
    %{<p>
        This Vintage edition of The Plays of Oscar Wilde contains the plays that made Wilde 
        one of the most important dramatists of his time, including The Importance of Being 
        Earnest, one of the great works of modern literature.Oscar Wilde's plays demonstrate 
        once again why their author must be seen as both an inaugurator and a master of 
        modernism. In his best work, the subversive insights embedded in his wit continue 
        to challenge our common assumptions. Wilde's ability to unsettle and startle us 
        anew with his radical vision of the artifice inherent in the self's construction 
        makes him our contemporary.
      </p>},
  :image_url => '/images/PoOW.jpg',
  :price => 27.86,
  :heat => 3845,
  :category_ids => [Category.where(:name => 'Arts').first.id])
  
Product.create(:title => 'A Tail of Two Cities',
  :description => 
    %{<p>
        It was the best of books and possibly the best of recorded versions. Dickens's 
        dramatic narrative of the French Revolution and the unremitting vengeance of both 
        Mesdames Defarge and La Guillotine are brought to life by Gordon Griffin's fully 
        voiced reading. His reading is not as rushed as some, but is equally dramatic with 
        flawless enunciation and a broad tonal range. What's more, each thirty-five minute 
        side of the twelve tapes has a certain narrative completeness, ending with about 
        thirty seconds of period harpsichord music. Classroom teachers might find these 
        tapes useful for introducing the book, dealing with difficult passages or simply 
        encouraging reluctant readers. 
      </p>},
  :image_url => '/images/AToTC.jpg',
  :price => 26.58,
  :heat => 2574,
  :category_ids => [Category.where(:name => 'Literature').first.id])
  
Product.create(:title => 'David Copperfield',
  :description => 
    %{<p>
        Like a visit with old friends, this production of David Copperfield assumes that 
        the listener is familiar with the Dickens milieu. The emphasis is on Dickens''s 
        colorful characters, who appear one after another in performances consistently 
        deft and sure. Even the grotesque are played with a restraint that retains their 
        humanity. Music and sound effects are used well, but sparingly, never distracting 
        from the voices. 
      </p>},
  :image_url => '/images/DC.jpg',
  :price => 25.58,
  :heat => 1734,
  :category_ids => [Category.where(:name => 'Classics').first.id])
  
Product.create(:title => '100 Selected Stories',
  :description => 
    %{<p>
        This collection of 100 of O Henry's finest stories is a showcase for the sheer 
        variety of one of America's best and best-loved short story writers The variety 
        of the stories is amazing; O Henry is as at home describing life south of the Rio 
        Grande as he is chronicling the activities and concerns of 'the four million' 
        ordinary citizens who inhabited turn-of-the-century New York. They are marked by 
        coincidence and surprise endings as well as the compassion and high humour that have 
        made O Henry's stories popular for the last century. 
      </p>},
  :image_url => '/images/100SS.jpg',
  :price => 27.40,
  :heat => 4722,
  :category_ids => [Category.where(:name => 'Classics').first.id])

User.create(:name => 'admin',
  :password => 'admin',:password_confirmation=>'admin')
