// Разработка игры 7up
import numpy as np
import random
class ConnectFourGame:
    def __init__(self):
        self.board = [['.' for _ in range(7)] for _ in range(6)]
        self.turn = '+'

    def is_valid_move(self, col):
        return self.board[0][col] == '.'

    def make_move(self, col):
        if not self.is_valid_move(col):
            return False
        for row in range(5, -1, -1):
            if self.board[row][col] == '.':
                self.board[row][col] = self.turn
                break
        self.turn = '+' if self.turn == '-' else '-'
        return True

    def check_winner(self):
        for row in range(6):
            for col in range(7):
                if self.board[row][col] != '.':
                    if col + 3 < 7 and self.board[row][col] == self.board[row][col + 1] == self.board[row][col + 2] == self.board[row][col + 3]:
                        return self.board[row][col]
                    if row + 3 < 6:
                        if self.board[row][col] == self.board[row + 1][col] == self.board[row + 2][col] == self.board[row + 3][col]:
                            return self.board[row][col]
                        if col + 3 < 7 and self.board[row][col] == self.board[row + 1][col + 1] == self.board[row + 2][col + 2] == self.board[row + 3][col + 3]:
                            return self.board[row][col]
                        if col - 3 >= 0 and self.board[row][col] == self.board[row + 1][col - 1] == self.board[row + 2][col - 2] == self.board[row + 3][col - 3]:
                            return self.board[row][col]
        return None

class ConnectFourBot:
    def __init__(self, player):
        self.player = player

    def get_move(self, game):
        valid_moves = [col for col in range(7) if game.is_valid_move(col)]
        return random.choice(valid_moves) if valid_moves else None

def play_connect_four_with_bots():
    game = ConnectFourGame()
    bot1 = ConnectFourBot('+')
    bot2 = ConnectFourBot('-')

    current_player = '+'
    while True:
        print("Current player:", current_player)
        for row in game.board:
            print(' '.join(row))
        print()
        move = bot1.get_move(game) if current_player == '+' else bot2.get_move(game)
        if move is not None:
            if game.make_move(move):
                winner = game.check_winner()
                if winner:
                    print("Winner:", winner)
                    break
                current_player = '+' if current_player == '-' else '-'
        else:
            current_player = '+' if current_player == '-' else '-'
            if all(not game.is_valid_move(col) for col in range(7)):
                print("Draw!")
                break

if __name__ == "__main__":
    play_connect_four_with_bots()
