def test_kind_assertions
  assert_equal(true, Numeric.ancestors.include?(value.class))
  assert_kind_of Numeric, value
end
