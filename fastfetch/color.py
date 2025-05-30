import tkinter as tk
from tkinter import ttk

class IndividualCharColorizer:
    def __init__(self, root):
        self.root = root
        self.root.title("Character Colorizer")
        self.root.geometry("600x400") # Increased window size

        self.char_limit = 9
        self.current_text = [" " for _ in range(self.char_limit)] # Initialize with spaces
        self.colors = ["black", "red", "green", "blue", "purple", "orange", "brown"]
        self.char_colors = [0 for _ in range(self.char_limit)] # Index into self.colors for each char

        self.create_widgets()

    def create_widgets(self):
        # Input Frame
        input_frame = ttk.Frame(self.root, padding="10")
        input_frame.pack(pady=10)

        ttk.Label(input_frame, text="Enter up to 9 characters:").pack(side=tk.LEFT, padx=5)
        self.text_input = ttk.Entry(input_frame, width=15)
        self.text_input.pack(side=tk.LEFT, padx=5)
        self.text_input.bind("<KeyRelease>", self.update_display) # Update display on key release
        self.text_input.config(validate="key", validatecommand=(self.root.register(self.validate_input), "%P"))

        # Character Display Frame
        self.display_frame = ttk.Frame(self.root, padding="10")
        self.display_frame.pack(pady=20)

        self.char_labels = []
        for i in range(self.char_limit):
            label = tk.Label(self.display_frame, text=" ", font=("Arial", 24, "bold"),
                             width=2, relief="solid", borderwidth=1)
            label.grid(row=0, column=i, padx=2, pady=2)
            label.bind("<Button-1>", lambda event, idx=i: self.change_char_color(idx))
            self.char_labels.append(label)

        self.update_display() # Initial display update

    def validate_input(self, new_text):
        if len(new_text) <= self.char_limit:
            return True
        else:
            return False

    def update_display(self, event=None):
        entered_text = self.text_input.get()
        
        # Clear existing text and colors
        for i in range(self.char_limit):
            self.current_text[i] = " "
            self.char_colors[i] = 0 # Reset color to black (index 0)

        # Populate with new text
        for i, char in enumerate(entered_text[:self.char_limit]):
            self.current_text[i] = char

        self.refresh_labels()

    def change_char_color(self, char_index):
        if char_index < self.char_limit:
            current_color_idx = self.char_colors[char_index]
            next_color_idx = (current_color_idx + 1) % len(self.colors)
            self.char_colors[char_index] = next_color_idx
            self.refresh_labels()

    def refresh_labels(self):
        for i in range(self.char_limit):
            char_label = self.char_labels[i]
            char_label.config(text=self.current_text[i],
                              fg=self.colors[self.char_colors[i]])

if __name__ == "__main__":
    root = tk.Tk()
    app = IndividualCharColorizer(root)
    root.mainloop()
