class MandrillMailer 

  def self.signup_foodie_email(user)
    @user = user
    require 'mandrill'
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "Welcome to Simmr, #{user.first_name} #{user.last_name}!",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"Psst, #{user.first_name}, you're in!
        Life is too short to not make every day amazing. We curate unique experiences at the restaurants and bars you love, so you can experience them as no customer has ever before.
        Come right this way: http://www.simmr.co/events
        Nomnom,
        Neeharika and Wendy
        http://www.simmr.co
        P.S. As always, please don't hesitate to reach out to us directly by replying to this email.",
        # below are global merge vars. the name is the *|MERGE|* tag
        #{}"global_merge_vars"=>[],
        :to=>[
          {
            :email=> @user.email,
            :name=> @user.first_name
          }
      ],
      :from_email=>"neeharika@simmr.co"
      }
    template_name = "welcome-email"
    template_content = [
      {
        :name => "title",
        :content => "Psst, you're in! Welcome to Simmr"
      },
      {
        :name => "std_preheader_content",
        :content => "<p>Welcome to Simmr, #{user.first_name}!</p>"
      },
      {
        :name => "image",
        :content => "<img src = 'http://www.simmr.co/assets/launch_page_mock_done.jpg' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "content",
        :content => "<h1>Psst, #{user.first_name}, you're in!</h1><p>Life is too short to not make every day amazing. We curate unique experiences at the restaurants and bars you love, so you can experience them as no customer has ever before.
        <br><p>Come right <a href = 'http://www.simmr.co/events' target = '_blank'>this way</a>.<br><br>Nomnom, <br>Neeharika and Wendy<br><a href = 'http://www.simmr.co'>simmr</a>
        <br><br>P.S. As always, please don't hesitate to reach out to us directly by replying to this email.</p>"
      },
      {
        :name => "social",
        :content => "<a href='http://www.facebook.com/simmrco'>like on Facebook </a> | <a href='https://twitter.com/simmrco'>follow on Twitter</a> | <a href = 'http://simmrco.wordpress.com'>check out our blog</a>"
      },
      {
        :name => "footer-content",
        :content => "You're receiving this because you just signed up!"
        },
      {
        :name => "utility",
        :content => "<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }]
    sending = m.messages.send_template template_name, template_content, message 
  end

  def self.signup_chef_email(user)
    @user = user
    require 'mandrill'
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "Welcome to Simmr, #{user.first_name} #{user.last_name}!",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"Welcome, #{user.first_name},
        The opposite of the daily deal, we seek to work with you to create unique, chatter-worthy experiences for passionate customers who want to forge a deeper relationship with you. 
        We'll be reaching out to you shortly to talk about your goals and answer any questions. We look forward to growing your business with you.
        Cheers,
        Neeharika and Wendy
        http://www.simmr.co
        P.S. As always, please don't hesitate to reach out to us directly by replying to this email.",
        # below are global merge vars. the name is the *|MERGE|* tag
        #{}"global_merge_vars"=>[],
        :to=>[
          {
            :email=> @user.email,
            :name=> @user.first_name
          }
      ],
      :from_email=>"neeharika@simmr.co"
      }
    template_name = "welcome-email"
    template_content = [
      {
        :name => "title",
        :content => "Welcome to Simmr"
      },
      {
        :name => "std_preheader_content",
        :content => "<p>Welcome to Simmr, #{user.first_name}!</p>"
      },
      {
        :name => "image",
        :content => "<img src = 'http://www.simmr.co/assets/launch_page_mock_done.jpg' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "content",
        :content => "<h1>Welcome, #{user.first_name}!</h1><p>The opposite of the daily deal, we seek to work with you to create unique, chatter-worthy experiences for passionate customers who want to forge a deeper relationship with you. 
        <br><p>We'll be reaching out to you shortly to talk about your goals and answer any questions. We look forward to growing your business with you.<br><br>Cheers, <br>Neeharika and Wendy<br><a href = 'http://www.simmr.co'>simmr</a>
        <br><br>P.S. As always, please don't hesitate to reach out to us directly by replying to this email.</p>"
      },
      {
        :name => "social",
        :content => "<a href='http://www.facebook.com/simmrco'>like on Facebook </a> | <a href='https://twitter.com/simmrco'>follow on Twitter</a> | <a href = 'http://simmrco.wordpress.com'>check out our blog</a>"
      },
      {
        :name => "footer-content",
        :content => "You're receiving this because you just signed up!"
        },
      {
        :name => "utility",
        :content => "<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }]
    sending = m.messages.send_template template_name, template_content, message 
  end


  def self.event_purchase_email(user, event)
    @user = user
    @event = event
    require 'mandrill'
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "#{user.first_name}, you're going to #{event.title} with #{event.host}!",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"#{user.first_name}, you're going to #{event.title} with #{event.host}!
        We're glad you can make it. Now all you have to do is show up and give your name at the door.
        Eating is best in the company of good friends, so spread the word and bring friends!
        Your event details: www.simmr.co/events/#{event.id}
        Get excited!
        Neeharika and Wendy
        http://www.simmr.co
        P.S. As always, please don't hesitate to reach out to us directly by replying to this email.",
        # below are global merge vars. the name is the *|MERGE|* tag
        #{}"global_merge_vars"=>[],
        :to=>[
          {
            :email=> "linwendy08@gmail.com",
            :name=> @user.first_name
          }
      ],
      :from_email=>"neeharika@simmr.co"
      }
    template_name = "welcome-email"
    template_content = [
      {
        :name => "title",
        :content => "#{user.first_name}, you're going to #{event.title} with #{event.host}!"
      },
      {
        :name => "std_preheader_content",
        :content => "<p>#{user.first_name}, you're going to #{event.title} with #{event.host}!</p>"
      },
      {
        :name => "image",
        :content => "<img src = 'http://www.simmr.co/assets/launch_page_mock_done.jpg' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "content",
        :content => "<h1>#{user.first_name}, you're going to #{event.title} with #{event.host}!</h1><p> We're glad you can make it. Now all you have to do is show up and give your name at the door. 
        <br><p>Eating is best in the company of good friends, so spread the word and bring friends!<br><a href = 'http://www.simmr.co/events/#{event.id}>Your Event Details</a><br><br>Get excited! <br>Neeharika and Wendy<br><a href = 'http://www.simmr.co'>simmr</a>
        <br><br>P.S. As always, please don't hesitate to reach out to us directly by replying to this email.</p>"
      },
      {
        :name => "social",
        :content => "<a href='http://www.facebook.com/simmrco'>like on Facebook </a> | <a href='https://twitter.com/simmrco'>follow on Twitter</a> | <a href = 'http://simmrco.wordpress.com'>check out our blog</a>"
      },
      {
        :name => "footer-content",
        :content => "You're receiving this because you just bought a ticket to this event!"
        },
      {
        :name => "utility",
        :content => "<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }]
    sending = m.messages.send_template template_name, template_content, message 
  end

end