class MandrillMailer < Devise::Mailer

  require 'mandrill'

  helper :application

  default from: 'neeharika@simmr.co'

  def reset_password_instructions(record, token, opts={})
    @token = token
    a=edit_user_password_url(record, :reset_password_token=> @token)
    headers['X-MC-Track'] = "False, False"
    m=Mandrill::API.new(ENV["MANDRILL_KEY"])
      message= {
        :subject=> "Simmr Password Reset",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"Hello, #{record.first_name}! Someone has requested a link to change your password. You can do this through this link: #{a}. If you didn't request this, please ignore this email. Your password won't change until you access the link above and create a new one.",
        # below are global merge vars. the name is the *|MERGE|* tag
        #{}"global_merge_vars"=>[],
        :to=>[
          {
            :email=> record.email,
            :name=> record.first_name
          }]
      }
    sending = m.messages.send message 
    super
  end

  def confirmation_instructions(record, token, opts={})
    super
  end

  def unlock_instructions(record, token, opts={})
    super
  end

  def self.signup_foodie_email(user)
    @user = user
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
        :content => ""#"<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }
      ]
    sending = m.messages.send_template template_name, template_content, message 
  end

  def self.signup_chef_email(user)
    @user = user
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
        :content => ""#"<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }
      ]
    sending = m.messages.send_template template_name, template_content, message 
  end

  def self.notify_us_of_user(user)
    @user = user
    if !@user.chef.nil?
      if @user.chef==true
        @type="CHEF"
      else
        @type="FOODIE"
      end
    else
      @type="USER (cant tell chef or foodie)"
    end
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "NEW SIMMR #{@type}: #{user.first_name} #{user.last_name}",
        :text=>"SIMMR HAS A NEW #{@type}: #{user.first_name} #{user.last_name} email them? #{user.email} user_id? #{user.id}",
        :to=>[
          {
            :email=> "neeharika.b@gmail.com",
            :name=> "Neeharika"
          },
          {
            :email=> "email.wendylin@gmail.com",
            :name=> "Wendy"
          }
        ],
      :html=>"<html>SIMMR HAS A NEW #{@type}: <br> #{user.first_name} #{user.last_name}<br>email them?<br>#{user.email}<br> user_id? <br> #{user.id}</html>",
      :from_email=>"neeharika@simmr.co"
      }
    sending = m.messages.send message
    puts sending
  end

  def self.signup_generic_email(signup)
    @signup = signup
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "Welcome to Simmr, #{signup.email}!",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"Psst, #{signup.email}, you're in!
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
            :email=> @signup.email,
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
        :content => "<p>Welcome to Simmr, #{signup.email}!</p>"
      },
      {
        :name => "image",
        :content => "<img src = 'http://www.simmr.co/assets/launch_page_mock_done.jpg' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "content",
        :content => "<h1>Psst, #{signup.email}, you're in!</h1><p>Life is too short to not make every day amazing. We curate unique experiences at the restaurants and bars you love, so you can experience them as no customer has ever before.
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
        :content => ""#"<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }
      ]
    sending = m.messages.send_template template_name, template_content, message 
  end

  def self.notify_us_of_signup(signup)
    @signup = signup
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "NEW SIMMR SIGNUP: #{signup.email}",
        :text=>"SIMMR HAS A NEW SIGNUP: #{signup.email}",
        :to=>[
          {
            :email=> "neeharika.b@gmail.com",
            :name=> "Neeharika"
          },
          {
            :email=> "email.wendylin@gmail.com",
            :name=> "Wendy"
          }
        ],
      :html=>"<html>SIMMR HAS A NEW SIGNUP: <br> #{signup.id} <br> #{signup.email}</html>",
      :from_email=>"neeharika@simmr.co"
      }
    sending = m.messages.send message
    puts sending
  end

  def self.event_purchase_email(user, charge, event, guest_count, location)
    @user = user
    m = Mandrill::API.new(ENV["MANDRILL_KEY"])
      message = {
        :subject=> "Simmr Purchase Confirmation--#{event.host.profile.biz_name}",
        :from_name=> "Simmr Concierge",
        :from_email => "neeharika@simmr.co",
        :text=>"#{user.first_name}, you just registered for #{event.title} with #{event.host.profile.biz_name}!
        Just wanted to let you know that your payment went through for #{'$%6.2f' % (charge.amount/100.00)}, and you're all set for #{guest_count} spot(s).
        Take a moment to check your event details and add the event to your calendar by using the calendar widget on the event page.
        As a reminder, the event takes place at #{event.time.strftime('%l:%M %p')} on #{event.date.strftime('%A, %B %e, %Y')} and will be located at #{location.address1} in #{location.neighborhood}.
        Eating is best in the company of good friends, so be sure to invite your friends to join you before tickets sell out!
        Get excited,
        Neeharika and Wendy
        http://www.simmr.co
        P.S. As always, feel free to reach out with any questions by replying to this email.",
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
        :content => "#{user.first_name}, you just registered for #{event.title} with #{event.host}!"
      },
      {
        :name => "std_preheader_content",
        :content => "<p>#{user.first_name}, you just registered for #{event.title} with #{event.host.profile.biz_name}!</p>"
      },
      {
        :name => "image",
        :content => "<img src = '#{event.covers.first.image}' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "content",
        :content => "<h1>#{user.first_name}, you just registered for #{event.title} with #{event.host.profile.biz_name}!</h1><p> Just wanted to let you know that your payment went through for #{'$%6.2f' % (charge.amount/100.00)}, and you're all set for #{guest_count} spot(s).
        <br><p>Take a moment to check your event details and add the event to your calendar by using the calendar widget on the <a href= 'http://www.simmr.co/events/#{event.id}'>event page</a>.
        <br><br>As a reminder, the event takes place at <b>#{event.time.strftime('%l:%M %p')}</b> on <b>#{event.date.strftime('%A, %B %e, %Y')}</b> and will be located at <b>#{location.address1} in #{location.neighborhood}</b>.
        <br><br>Eating is best in the company of good friends, so spread the word and bring friends!
        <br><br>Get excited, <br>Neeharika and Wendy
        <br><a href = 'http://www.simmr.co'>simmr</a>
        <br><br>P.S. As always, feel free to reach out with any questions by replying to this email.</p>"
      },
      {
        :name => "social",
        :content => "<a href='http://www.facebook.com/simmrco'>like on Facebook </a> | <a href='https://twitter.com/simmrco'>follow on Twitter</a> | <a href = 'http://simmrco.wordpress.com'>check out our blog</a>"
      },
      { 
        :name => "footer-content",
        :content => "You're receiving this because you just bought a ticket to a Simmr experience!"
      },
      {
        :name => "utility",
        :content => ""#"<a href='*|UNSUB:http://www.simmr.co/home/unsubscribe|*'>unsubscribe from this list</a>"
      }
      ]
    sending = m.messages.send_template template_name, template_content, message 
  end
end