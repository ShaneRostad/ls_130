def test_exception_assertion
  assert_raises NoExperienceError do
    employee.hire
  end
end
