import type { Metadata } from "next";

import "./globals.css";

export const metadata: Metadata = {
  title: "Test ci/cd",
  description: "using github actions and docker to deploy a next.js app",
};

export default function RootLayout({
  children,
}: Readonly<{
  children: React.ReactNode;
}>) {
  return (
    <html lang="fr">
      <body>{children}</body>
    </html>
  );
}
