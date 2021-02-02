Rails.application.routes.draw do

  get("/", {:controller => "application", :action => "take_me_home"})

  get("/forex", {:controller => "application", :action => "pick_rate_one"})

  get("/forex/:pickone", {:controller => "application", :action => "pick_rate_two"})

  get("/forex/:pickone/:picktwo", {:controller => "application", :action => "compute_forex"})
end
