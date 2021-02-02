class ApplicationController < ActionController::Base

def take_me_home

  render({:template => "static_pages/home.html.erb"})
end

def pick_rate_one
  @data = open("https://api.exchangerate.host/symbols").read
  @parsed = JSON.parse(@data)
  @symbols = @parsed.fetch("symbols")

  @firstpicks = @symbols.keys

  render({:template => "forex/pick_first.html.erb"})
end

def pick_rate_two
  @data = open("https://api.exchangerate.host/symbols").read
  @parsed = JSON.parse(@data)
  @symbols = @parsed.fetch("symbols")
  @pickone = params[:pickone]

  @secondpicks = @symbols.keys

  render({:template => "forex/pick_second.html.erb"})
end

def compute_forex
  @pickone = params[:pickone]
  @picktwo = params[:picktwo]

  @data = open("https://api.exchangerate.host/convert?from=" + @pickone + "&to=" + @picktwo).read
  @parsed = JSON.parse(@data)
  @result = @parsed.fetch("result")

  render({:template => "forex/forex_result.html.erb"})
end

end
