require "rails_helper"

RSpec.feature "Projects", type: :feature do
    context "Create project" do
        before(:each) do
          visit new_project_path
        end

        scenario "should be successful" do
          within("form") do
            fill_in "Title", with: "Project title"
            fill_in "Description", with: "Project description"
          end
          click_button "Create Project"
          expect(page).to have_content("Project was successfully created.")
        end
  
        scenario "should fail" do
          within("form") do
              fill_in "Title", with: ""
          end
          click_button "Create Project"
          expect(page).to have_content("Title can't be blank")
      end
   
        scenario "should fail" do
          within("form") do
            fill_in "Description", with: ""
          end
          click_button "Create Project"
          expect(page).to have_content("Description can't be blank")
        end
      end
    context "Update project" do
      let(:project) { Project.create(title: "Test title", description: "Test content") }
      before(:each) do
        visit edit_project_path(project)
      end
 
 
      scenario "should be successful" do
        within("form") do
          fill_in "Description", with: "New description content"
        end
        click_button "Update Project"
        expect(page).to have_content("Project was successfully updated")
      end

      scenario "should fail" do
        within("form") do
            fill_in "Title", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Title can't be blank")
    end
 
      scenario "should fail" do
        within("form") do
          fill_in "Description", with: ""
        end
        click_button "Update Project"
        expect(page).to have_content("Description can't be blank")
      end
    end
end
 


