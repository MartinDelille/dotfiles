return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")

		local mortal = {
			"                           _..gggggppppp.._                   ",
			"                  _.gd$$$$$$$$$$$$$$$$$$bp._                  ",
			'               .g$$$$$$P^^""j$$b""""^^T$$$$$$p.               ',
			'            .g$$$P^T$$b    d$P T;       ""^^T$$$p.            ',
			'          .d$$P^"  :$; `  :$;                "^T$$b.          ',
			"        .d$$P'      T$b.   T$b                  `T$$b.        ",
			"       d$$P'      .gg$$$$bpd$$$p.d$bpp.           `T$$b       ",
			"      d$$P      .d$$$$$$$$$$$$$$$$$$$$bp.           T$$b      ",
			"     d$$P      d$$$$$$$$$$$$$$$$$$$$$$$$$b.          T$$b     ",
			"    d$$P      d$$$$$$$$$$$$$$$$$$P^^T$$$$P            T$$b    ",
			"   d$$P    '-'T$$$$$$$$$$$$$$$$$$bggpd$$$$b.           T$$b   ",
			"  :$$$      .d$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p._.g.     $$$;  ",
			'  $$$;     d$$$$$$$$$$$$$$$$$$$$$$$P^"^T$$$$P^^T$$$;    :$$$  ',
			' :$$$     :$$$$$$$$$$$$$$:$$$$$$$$$_    "^T$bpd$$$$,     $$$; ',
			" $$$;     :$$$$$$$$$$$$$$bT$$$$$P^^T$p.    `T$$$$$$;     :$$$ ",
			":$$$      :$$$$$$$$$$$$$$P `^^^'    \"^T$p.    lb`TP       $$$;",
			":$$$      $$$$$$$$$$$$$$$              `T$$p._;$b         $$$;",
			"$$$;      $$$$$$$$$$$$$$;                `T$$$$:Tb        :$$$",
			"$$$;      $$$$$$$$$$$$$$$                        Tb    _  :$$$",
			":$$$     d$$$$$$$$$$$$$$$.                        $b.__Tb $$$;",
			":$$$  .g$$$$$$$$$$$$$$$$$$$p...______...gp._      :$`^^^' $$$;",
			" $$$;  `^^'T$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$p.    Tb._, :$$$ ",
			' :$$$       T$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$b.   "^"  $$$; ',
			"  $$$;       `$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$b      :$$$  ",
			"  :$$$        $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;     $$$;  ",
			"   T$$b    _  :$$`$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$;   d$$P   ",
			"    T$$b   T$g$$; :$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$  d$$P    ",
			"     T$$b   `^^'  :$$ \"^T$$$$$$$$$$$$$$$$$$$$$$$$$$$ d$$P     ",
			"      T$$b        $P     T$$$$$$$$$$$$$$$$$$$$$$$$$;d$$P      ",
			"       T$$b.      '       $$$$$$$$$$$$$$$$$$$$$$$$$$$$P       ",
			"        `T$$$p.   bug    d$$$$$$$$$$$$$$$$$$$$$$$$$$P'        ",
			"          `T$$$$p..__..g$$$$$$$$$$$$$$$$$$$$$$$$$$P'          ",
			'            "^$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$^"            ',
			'               "^T$$$$$$$$$$$$$$$$$$$$$$$$$$P^"               ',
			'                   """^^^T$$$$$$$$$$P^^^"""                   ',
		}

		local pacman_ghost = {
			"            ██████             ",
			"        ████▒▒▒▒▒▒████         ",
			"      ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██       ",
			"    ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██     ",
			"  ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒       ",
			"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓   ",
			"  ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓   ",
			"██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██ ",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██ ",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██ ",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██ ",
			"██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██ ",
			"██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██ ",
			"████  ██▒▒██  ██▒▒▒▒██  ██▒▒██ ",
			"██      ██      ████      ████ ",
		}
		--
		-- Set header

		dashboard.section.header.val = mortal

		-- Set menu
		dashboard.section.buttons.val = {
			dashboard.button("e", "  > New File", "<cmd>ene<CR>"),
			dashboard.button("SPC ee", "  > Toggle file explorer", "<cmd>NvimTreeToggle<CR>"),
			dashboard.button("SPC ff", "󰱼 > Find File", "<cmd>Telescope find_files<CR>"),
			dashboard.button("SPC fs", "  > Find Word", "<cmd>Telescope live_grep<CR>"),
			dashboard.button("SPC wr", "󰁯  > Restore Session For Current Directory", "<cmd>SessionRestore<CR>"),
			dashboard.button("q", " > Quit NVIM", "<cmd>qa<CR>"),
		}

		-- Send config to alpha
		alpha.setup(dashboard.opts)

		-- Disable folding on alpha buffer
		vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
	end,
}
