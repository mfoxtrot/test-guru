class CheckAchievements

  def initialize(test_passage)
    @test_passage = test_passage
    @badges = Badge.all
  end

  def call
    result = []
    @badges.each do |badge|
      if self.send("#{badge.rule_name}?", badge.rule_parameter)
        result << badge
      end
    end
    result
  end

  private

  def all_tests_at_category?(*args)
    true
  end

  def passing_test_at_first_attempt?(*args)
    false
  end

  def all_tests_at_level?(*args)
    false
  end
end
