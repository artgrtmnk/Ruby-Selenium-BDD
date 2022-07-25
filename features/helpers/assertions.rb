require 'solid_assert'
require 'page-object'
require 'selenium-webdriver'

class Assertions
    def assert_response_code(code, response)
        assert code == response.code, "Response code is not equal #{code}"
    end
    
    def assert_contains(compare_string, assertion_objective)
        assert assertion_objective.include?(compare_string), "Element or response doesn't contains expected payload."
    end

    def assert_not_contains(compare_string, assertion_objective)
        assert !assertion_objective.include?(compare_string), "Something went wrong."
    end
end

