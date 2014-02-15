$ ->
  options = {
    name: "tour",
    container: "body",
    keyboard: true,
    storage: false,
    debug: true,
    orphan: true,
    backdrop: true,
  }
  tour = new Tour(options)
  

  intro1  = { 
    element: "#logo", 
    content: "Welcome to SolesOut", 
    placement: "bottom",
    animation: true,
    backdrop: false,
    template: "<div class='popover tour'>
    <div class='arrow'></div>
    <h3 class='popover-content'></h3>
    <div class='popover-navigation'>
        <a data-role='next'>Next</a>
    </div>
    </nav>
  </div>",
  }
  intro2  = { 
    element: "ul.create", 
    content: "The NEW Buying/Selling/Voting Sneaker Community. ",
    placement: "bottom",
    animation: true,
    backdrop: false,
  }
  intro3  = { 
    element: "#post-0", 
    content: "This is the highest scoring pair of shoes on the site right now.",
    placement: "bottom",
    animation: true,
    backdrop: true,
  }
  intro4  = { 
    element: "#post-0 .votes", 
    placement: "top",
    content: "After you Login, Vote on Shoes You Think are Cool."
    backdrop: true,
    animation: true,
  }
  intro45  = { 
    element: "#author-0", 
    placement: "bottom",
    content: "Be Respectful and Karma will help you buy and sell more shoes."
    backdrop: false,
    animation: true,
  }
  
  intro5  = { 
    element: "#post-2", 
    placement: "top",
    title: "Top Three Reasons People Use SolesOut?", 
    content: "Lower Fees than Anyone Else."
    animation: true,
    backdrop: false,
  }
  intro6  = { 
    element: "#post-3", 
    placement: "top",
    content: "No need for communication between buyer/seller before a purchase."
    title: "Top Three Reasons People Use SolesOut?", 
    animation: true,
    backdrop: false,
  }
  intro7  = { 
    element: "#post-4", 
    placement: "top",
    content: "Everyone who visits the site should vote. its fact that the more eyes a listing gets the easier it is to sell."
    animation: true,
    backdrop: false,
  }

  intro8  = { 
    element: "#post-5", 
    placement: "top",
    content: "The more votes a shoe gets, the better chance it has at the top of the home page."
    animation: true,
    backdrop: false,
  }

  intro9  = { 
    element: "#post-6", 
    placement: "top",
    content: "Down Voting will let the seller know he should rethink what he's offering at what price."
    animation: true,
    backdrop: false,
  }

  intro10  = { 
    element: "#post-7", 
    placement: "top",
    content: "Peace.", 
    animation: false,
    backdrop: false,
    template: "<div class='popover tour'>
    <div class='arrow'></div>
      <a  class='btn btn-block btn-inverse' data-role='end'>
        <h3 class='popover-content'></h3>
      </a>
    </nav>
  </div>",
  }
  tour.addSteps([intro1, intro2, intro3, intro4, intro45, intro5, intro6, intro7, intro8, intro9, intro10]);
  tour.init()
  window.tour = tour
  # tour.start()
