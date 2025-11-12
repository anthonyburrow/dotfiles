import ranger.api
from ranger.container.directory import Directory

old_load_content = Directory.load_content

def new_load_content(self, schedule=None):
    old_load_content(self, schedule)
    
    # Filter: keep non-hidden files and all directories (including hidden ones)
    # Remove only hidden files and lost+found
    if self.files is not None:
        self.files = [f for f in self.files 
                      if (f.is_directory or not f.basename.startswith('.')) 
                      and f.basename != 'lost+found']
        self.files_all = self.files

Directory.load_content = new_load_content