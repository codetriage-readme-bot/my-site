RSpec::Matchers.define :have_title do |item|
  match do |page|
    selector = '.' + item.downcase + ' h3'
    Capybara.string(page.body).has_selector?(selector, text: item)
  end
end

RSpec::Matchers.define :have_list_of_items do |selector, items|
  match do |page|
    selector = selector + ' ul li'
    items.map do |item|
      # TODO: divide fail msg for array (items) into fail msg for every item
      expect(page).to have_selector(selector, text: item), "item #{item}"
    end
  end
end

describe "About Page" do
  describe "GET /about" do
    
    before (:each) do
      visit "/about"
    end
    
    it "request success" do
      expect(page.status_code).to be(200)
    end
    
    it "has title" do
      expect(page).to have_selector 'h2', text: "About Me"
    end
    
    #describe "musthead" do
    #  it "has title" do expect(page).to have_selector 'h2', text: "About Me" end
    #  it "has name" do expect(page).to have_selector 'strong', text: "Raman Skaskevich" end
    #  it "has link to wiki"
    #  it "has link to Ericpol page"
    #  it "has link to projects page"
    #end
    
    context "CV parts" do
    
      describe "summary" do
        let(:klas) { '.summary' }
        it "has class summary" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          #expect(page).to have_selector '.summary h3', text: 'Summary'
          expect(page).to have_title 'Summary'
        end
      end
      
      describe "skills" do
        let(:klas) { '.skills' }
        it "has class skills" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          expect(page).to have_title 'Skills'
        end
        it "has list of skills" do
          items = ['Ruby','Ruby on Rails','JavaScript','HTML/CSS']
          expect(page).to have_list_of_items(klas, items)
        end
      end
      
      describe "experience" do
        let(:klas) { '.experience' }
        it "has class experience" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          expect(page).to have_title 'Experience'
        end
        describe "list of jobs" do
          it "Ericpol" do
            expect(find(klas)).to have_content('Ericpol')
            expect(find(klas)).to have_content('Junior Software Developer')
            expect(find(klas)).to have_content('08.2012 - 12.2014')
          end
          it "Ericsson Ericpol" do
            expect(find(klas)).to have_content('Ericsson Ericpol')
            expect(find(klas)).to have_content('Software Developer')
            expect(find(klas)).to have_content('01.2015 - ongoing')
          end
        end
      end
      
      describe "education" do
        let(:klas) { '.education' }
        it "has class education" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          expect(page).to have_title 'Education'
        end
        describe "list of schools" do
          it "BrSTU" do
            expect(find(klas)).to have_content('Brest State Technical University')
            expect(find(klas)).to have_content('Bachelor of Computer Science')
            expect(find(klas)).to have_content('09.2007 - 06.2012')
          end
        end
      end
      
      describe "languages" do
        let(:klas) { '.languages' }
        it "has class languages" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          expect(page).to have_title 'Languages'
        end
        it "has list of languages" do
          items = ['English','Polish','Russian','Belarussian']
          expect(page).to have_list_of_items(klas, items)
        end
      end
      
      describe "courses" do
        let(:klas) { '.courses' }
        it "has class courses" do
          expect(page).to have_css(klas)
        end
        it "has title" do
          expect(page).to have_title 'Courses'
        end
        describe "list of courses" do
          it "Coursera" do
            expect(find(klas)).to have_content('Web Application Architectures')
            expect(find(klas)).to have_content('Coursera Verified Certificates')
            expect(find(klas)).to have_content('04.2015 - 05.2015')
          end
        end
      end
      
    end
    
  end
end