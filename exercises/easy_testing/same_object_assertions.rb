def test_same_object
  assert_equal(list.object_id, list.process.object_id)
  assert_same list, list.process
end
