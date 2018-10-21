people = [{"Jason" => "Leo"},{"Jill" => "Pisces"},{"Don" => "Leo"},{"Nadine" => "Leo"}]

is_pisces = Proc.new { |person| person.values[0] == 'Pisces'}
is_leo = Proc.new { |person| person.values[0] == 'Leo'}

leos = people.select(&is_leo)
pisces = people.select(&is_pisces)
