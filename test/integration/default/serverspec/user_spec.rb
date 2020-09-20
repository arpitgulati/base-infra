require 'spec_helper'

describe 'User' do

  describe user('fynd') do
    it { should exist }
  end

  describe user('deploy') do
    it { should exist }
  end

  describe user('kushan') do
    it { should exist }
  end

  describe user('subhranath') do
    it { should exist }
  end

  describe user('fynd') do
    it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDU/J1G64WDJiw6BrbGcHr1sKG7vZmFcWfT0CxtuFluB4BFOmXwJp1ohlerVY54xsSErh+4vOafnflM0YkvOZ6YN11klxkuKEFrJdHOrH2CsAPK+LsndeYyllzaMKXBmfCfXW6emihuIb+eIXsJDEWgPTb6Z3Vegovbt1P9m1LTBg4fF/IKkcrf05aOPhCPwN44E5XUQva5mMs3Jdc6NiXv/hJ/WnCv01Ymh8JgqQfhovDjLGhbgbTqaYjZGROSqkDNqQz3wQvPitWaeG7/Yh5/3cSb5f8w/UFcF0bMYcFAFCtPeqjctXOom8jYRMxvUxBktvUd/GKfs60Yqz5hmUCn fynd@gofynd.com' }
  end

  describe user('deploy') do
    it { should have_authorized_key 'ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDH0G/fSaVLwT8+kif61VjHWhKjgnGX7lIY3qi6CJKhTNH/RibcKwIgat4ezWjaqDA4tqK5JO4OjUWB4YvxsEFyleVr7az1Ms3U4mhyQR5YPy/LVhacJf+MtD0F3Ih9ny4W77yUk03hG5eYtJ49AxPoNKR53kReunN2TWH0BK7Vnih4YNSpxa17nw94GzLzZmOYXO0bkH0KpN1yNYKyoW2JGrXgaoXyZpjpVuP4hiLHoRrWsQ7DDrx7xUNRv/2vEySrgHg30KwR45DPqtntYDw3QEvk930EcPyi9msRbEO5agVHq2srbXCG88VnyLfF+QrTwwdM/OYh9Lf0C5WWzo3N deploy-orbis@localhost' }
  end
end
