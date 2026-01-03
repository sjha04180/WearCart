import type { Metadata } from 'next'
import { Inter } from 'next/font/google'
import './globals.css'
import { ToastContainer } from 'react-toastify'
import 'react-toastify/dist/ReactToastify.css'

const inter = Inter({ subsets: ['latin'] })

export const metadata: Metadata = {
  title: 'WearCart - Your Clothing, Digitaliized',
  description: 'Browse and shop for clothing online',
}

import { Web3Provider } from '@/components/Web3Provider'

export default function RootLayout({
  children,
}: {
  children: React.ReactNode
}) {
  return (
    <html lang="en">
      <body className={inter.className}>
        <Web3Provider>
          {children}
          <ToastContainer position="top-right" />
        </Web3Provider>
      </body>
    </html>
  )
}

