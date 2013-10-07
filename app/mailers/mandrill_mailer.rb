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
            :email=> 'email.wendylin@gmail.com',
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
        :name => "logo",
        :content =>"<img src = 'http://simmr.co/assets/beta_logo_final.png' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "image",
        :content => "<img src = 'http://2.s3.envato.com/files/57402247/fap-09.jpg' style = 'max-width:550px;' id = 'headerImage campaign-icon'>"
      },
      {
        :name => "city",
        :content => "San Francisco"
      },
      {
        :name => "content",
        :content => "<h1>Psst, #{user.first_name}, you're in!</h1><p>Life is too short to not make every day amazing. We curate unique experiences at the restaurants and bars you love, so you can experience them as no customer has ever before.
        <br><p>Come right <a href = 'http://www.simmr.co/events' target = '_blank'>this way</a>.<br><br>Nomnom, <br>Neeharika and Wendy<br><a href = 'http://www.simmr.co'>simmr</a>
        <br><br>P.S. As always, please don't hesitate to reach out to us directly by replying to this email.</p>"
      },
      {
        :name => "social",
        :content => "<a href='http://www.facebook.com/simmrco'>like on Facebook </a> | <a href='http://www.twitter.co/simmrco'>follow on Twitter</a> | <a href = 'http://simmrco.wordpress.com'>check out our blog</a>"
      },
      {
        :name => "footer-content",
        :content => "You're receiving this because you just signed up!"
        },
      {
        :name => "utility",
        :content => "<a href='*|UNSUB:http://www.simmr.co|*'>unsubscribe from this list</a>"
      }]
    sending = m.messages.send_template template_name, template_content, message 
  end

end