birds = %w(raven finch hawk eagle)

def passing_parameters(birds)
  def yield(birds)
end

passing_parameters(birds) do |_, _, *rest|
  puts "Raptors: #{rest.join(', ')}."
end
