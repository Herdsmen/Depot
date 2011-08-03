# encoding: utf-8
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
  :heat => 0)
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
  :heat => 0)
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
  :heat => 0)


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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)
  
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
  :heat => 0)

User.create(:name => '1',
  :password => '1',:password_confirmation=>'1')