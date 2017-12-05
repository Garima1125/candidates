# In this file we define the methods to help filter out candidates
# This way, we keep these methods separated from other potential parts of the program

def find(id)
  @candidates.each_with_index { |cad, index| return @candidates[index] if cad[:id]==id }

  return nil
end

def experienced?(candidate)
  candidate[:years_of_experience] >= 2 
end

def qualified_candidates(candidates)
  candidates.select do |candidate|
  experienced?(candidate)&&
  githubpoints?(candidate)&&
  languagesknown?(candidate)&&
  date?(candidate)&&
  age?(candidate)
end
  
end

def githubpoints?(candidate)
  candidate[:github_points] >= 100 
end

def languagesknown?(candidate)
  candidate[:languages].include? 'Ruby' || 'Python' 
end

def date?(candidate)
  candidate[:date_applied] > 15.days.ago
end

def age?(candidate)
  candidate[:age] > 18
end


# # More methods will go below

def ordered_by_qualifications(candidates)
  result = candidates.sort_by do |candidate| 
     [candidate[:years_of_experience] ,candidate[:github_points]]
   end
   result.reverse
end