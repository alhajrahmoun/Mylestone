require "application_system_test_case"

class MilestonesTest < ApplicationSystemTestCase
  setup do
    @milestone = milestones(:one)
  end

  test "visiting the index" do
    visit milestones_url
    assert_selector "h1", text: "Milestones"
  end

  test "creating a Milestone" do
    visit milestones_url
    click_on "New Milestone"

    fill_in "Date", with: @milestone.date
    fill_in "Story", with: @milestone.story
    fill_in "Title", with: @milestone.title
    fill_in "User", with: @milestone.user_id
    click_on "Create Milestone"

    assert_text "Milestone was successfully created"
    click_on "Back"
  end

  test "updating a Milestone" do
    visit milestones_url
    click_on "Edit", match: :first

    fill_in "Date", with: @milestone.date
    fill_in "Story", with: @milestone.story
    fill_in "Title", with: @milestone.title
    fill_in "User", with: @milestone.user_id
    click_on "Update Milestone"

    assert_text "Milestone was successfully updated"
    click_on "Back"
  end

  test "destroying a Milestone" do
    visit milestones_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Milestone was successfully destroyed"
  end
end
