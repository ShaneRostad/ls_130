def test_refute
  refute_equal true, list.include?('xyz')
  refute_includes list, 'xyz'
end
