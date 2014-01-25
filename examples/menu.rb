require 'eddy'

eddy = Eddy::Program.new
eddy.main_menu(
  {  
    title: 'My Options',
    items: [
      {
        text: 'NUKULAR',
        action: -> {
          Eddy::Menu.new(
            {
              title: 'NUKULAR OPTION'
            }
          )
        }
      }
    ]
  }
)
eddy.launch
