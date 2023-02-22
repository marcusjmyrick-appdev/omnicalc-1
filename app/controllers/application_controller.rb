class ApplicationController < ActionController::Base
  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb" })
  end
  def calculate_square
    @nums = params.fetch("markio")
    @num = @nums.to_f
    @square_of_num = (@num ** 2).to_f
    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_square_root_form
    render({ :template => "calculation_templates/square_root_form.html.erb" })
  end
  def calculate_square_root
    @num_1 = params.fetch("durkio").to_f
    @root_of_num = @num_1 ** 0.5
    render({ :template => "calculation_templates/square_root_results.html.erb"})
  end
  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb" })
  end
  def calculate_payment
    @principal = params.fetch("user_principal").to_f
    @apr = params.fetch("user_apr").to_f
    @years = params.fetch("user_years").to_i
  
    monthly_interest_rate = @apr / 12 / 100
    total_payments = @years * 12
  
    numerator = monthly_interest_rate * (1 + monthly_interest_rate) ** total_payments
    denominator = (1 + monthly_interest_rate) ** total_payments - 1
    @monthly_payment = (@principal * numerator / denominator).round(2)
  
    render({ :template => "calculation_templates/payment_results.html.erb" })
  end
  def blank_random_form
    render({ :template => "calculation_templates/random_form.html.erb" })
  end
  def calculate_random
    @num_5 = params.fetch("user_min")
    @num_6 = params.fetch("user_max")
    @min = @num_5.to_f
    @max = @num_6.to_f
    @random = rand(@min..@max)
    render({ :template => "calculation_templates/random_results.html.erb" })
  end
end
